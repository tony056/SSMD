//
//  GameScene.swift
//  SpaceShipGame_Thomas
//
//  Created by Thomas on 2015/8/10.
//  Copyright (c) 2015年 Thomas. All rights reserved.
//

import SpriteKit
import CoreMotion
class GameScene: SKScene {
    let playerSprite = SKSpriteNode(imageNamed: "Player")
    let motionManager = CMMotionManager()
    let maxPlayerAcceleration: CGFloat  = 400
    let maxPlayerVelocity: CGFloat = 200
    
    
    var accelX: UIAccelerationValue = 0
    var accelY: UIAccelerationValue = 0
    
    var playerAcceleration = CGVector(dx: 0, dy: 0)
    var playerVelocity = CGVector(dx: 0, dy: 0)
    var lastUpdateTime: CFTimeInterval = 0
    
    override func didMoveToView(view: SKView) {
        size = view.bounds.size
        backgroundColor = SKColor(red: 51.0/255, green: 255.0/255, blue: 170.0/255, alpha: 1)
        playerSprite.position = CGPoint(x: size.width - 50, y: size.height - 50)
        self.addChild(playerSprite)
        startMonitoringAccel()
        
        
            }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        
           }
   
    override func update(currentTime: CFTimeInterval) {
        let deltaTime = max(1.0/30, currentTime - lastUpdateTime)
        lastUpdateTime = currentTime
        
        updatePlayerAccelerationFroMotionManager()
        updatePlayer(deltaTime)
        
        
           }
    
    deinit{
        stopMonitoringAccel()
            }
    
    
    
    func startMonitoringAccel(){
        if motionManager.accelerometerAvailable{
            motionManager.startAccelerometerUpdates()
            print("accel updates on")
        }
    }
    func stopMonitoringAccel(){
        if motionManager.accelerometerAvailable && motionManager.accelerometerActive{
            motionManager.stopAccelerometerUpdates()
            print("accel updates off")
            
        }
    }
    
    
    func updatePlayerAccelerationFroMotionManager(){
        if let acceleration = motionManager.accelerometerData?.acceleration{
            let filterFactor = 0.75
            
            accelX = acceleration.x
            accelX = acceleration.x * filterFactor + accelX * (1 - filterFactor)
            accelY = acceleration.y * filterFactor + accelY * (1 - filterFactor)
            
            playerAcceleration.dx = CGFloat(accelY) * -maxPlayerAcceleration
            playerAcceleration.dy = CGFloat(accelX) * maxPlayerAcceleration
        }
    }
    
    func updatePlayer(dt: CFTimeInterval){
        playerVelocity.dx =
        playerVelocity.dx + playerAcceleration.dx * CGFloat(dt)
        playerVelocity.dy =
        playerVelocity.dy + playerAcceleration.dx * CGFloat(dt)
        playerVelocity.dx = min(maxPlayerVelocity, playerVelocity.dx)
        playerVelocity.dx = max(-maxPlayerVelocity, playerVelocity.dx)
        playerVelocity.dy = min(maxPlayerVelocity, playerVelocity.dy)
        playerVelocity.dy = max(-maxPlayerVelocity, playerVelocity.dy)
        
        
        var newPositionX = playerSprite.position.x + playerVelocity.dx * CGFloat(dt)
        var newPositionY = playerSprite.position.y + playerVelocity.dy * CGFloat(dt)
        
        newPositionX = max(100, newPositionX)
        newPositionX = min(newPositionX, 300)
        newPositionY = max(50, newPositionY)
        newPositionY = min(newPositionY, 200)
        
        playerSprite.position = CGPoint(x: newPositionX, y: newPositionY)
    }
}
