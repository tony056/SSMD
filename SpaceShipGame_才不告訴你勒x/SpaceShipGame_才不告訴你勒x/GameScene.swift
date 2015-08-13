//
//  GameScene.swift
//  SpaceShipGame_才不告訴你勒x
//
//  Created by CelineChien on 2015/8/10.
//  Copyright (c) 2015年 CelineChien. All rights reserved.
//

import SpriteKit
import CoreMotion



class GameScene: SKScene {
    
    let playerSprite = SKSpriteNode(imageNamed: "Player")
    let motionManager = CMMotionManager()
    let maxPlayerAcceleration: CGFloat = 200
    let maxPlayerVelocity: CGFloat = 200
    
    
    var accelX: UIAccelerationValue = 0
    var accelY: UIAccelerationValue = 0
    
    var playerAcceleration = CGVector(dx: 0, dy: 0)
    var playerVelocity = CGVector(dx:0, dy: 0)
    var lastUpdateTime: CFTimeInterval = 0
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        size = view.bounds.size
        backgroundColor = SKColor(red: 187/255, green: 255/255, blue: 238/255, alpha:1 )
        
        playerSprite.position = CGPoint(x:size.width - 50, y: size.height - 50)
        self.addChild(playerSprite)
        startMonitoringAccel()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let daltaTime = max(1.0/30, currentTime - lastUpdateTime)
        lastUpdateTime = currentTime
        
        updatePlayerAccelerationFromMotionManager()
        updatePlayer(daltaTime)
        
        
    }
    
    deinit {
        stopMonitoringAccel()
    }

    func startMonitoringAccel() {
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
    
    func updatePlayerAccelerationFromMotionManager() {
        if let acceleration = motionManager.accelerometerData?.acceleration {
            let filterFactor = 0.9
            
            //accelX = acceleration.x 這是另外ㄧ個上傳方法
            accelX = acceleration.x * filterFactor + accelX * (1 - filterFactor)
            accelY = acceleration.y * filterFactor + accelY * (1 - filterFactor)
            
            playerAcceleration.dx = CGFloat(accelY) * -maxPlayerAcceleration
            playerAcceleration.dy = CGFloat(accelX) * maxPlayerAcceleration
        }
        
    }
  
    func updatePlayer(dt: CFTimeInterval){
        playerVelocity.dx = playerVelocity.dx + playerAcceleration.dx * CGFloat(dt)
        playerVelocity.dy = playerVelocity.dy + playerAcceleration.dy * CGFloat(dt)
        
        playerVelocity.dx = min(maxPlayerVelocity, playerVelocity.dx)
        playerVelocity.dx = max(-maxPlayerVelocity, playerVelocity.dx)
        
        playerVelocity.dy = min(maxPlayerVelocity, playerVelocity.dy)
        playerVelocity.dy = max(-maxPlayerVelocity, playerVelocity.dy)
        
        var newPositionX = playerSprite.position.x + playerVelocity.dx * CGFloat(dt)
        var newPositionY = playerSprite.position.y + playerVelocity.dx * CGFloat(dt)
        
        newPositionX = max(30, newPositionX)
        newPositionX = min(newPositionX, 250)
        
        newPositionY = max(70, newPositionX)
        newPositionY = min(newPositionY, 250)
        
        playerSprite.position = CGPoint(x: newPositionX, y: newPositionY)
        
        
    }
    
    
    
}
