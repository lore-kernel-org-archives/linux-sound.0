From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Sun, 12 Mar 2000 09:37:44 +0000
Subject: [PROPOSED PATCH] sb_card.c
Message-Id: <marc-linux-sound-95286073029276@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 I'm going to make a patch for sb_card.c with the following cahnges.
 I'd like to have some comments on it.

 - Support for AWE will be droppen and moved to the
 awe_wave driver.

 - Support for joystick initialization will be dropped
 since the joystick maintainer told me he's working
 on a PNP implementation for joystick devices.

 - If a device is already active before the
 driver is loaded then it's current settings will
 be used. this will allow the user to manually configure
 each card via the /proc/isapnp interface if needed.

 - What about if i leave the card active when
 the driver is unloaded? Could this cause any trouble
 somewhere else?
 



-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/
