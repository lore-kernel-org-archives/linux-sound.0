From: calebharp2005@gmail.com
Date: Thu, 10 Nov 2022 21:10:09 +0000
Subject: [PATCH 0/1] sound: support HP Pavilion Aero 13-be0xxx Mute LED
Message-Id: <20221110211010.11128-1-calebharp2005@gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

From: Caleb Harper <calebharp2005@gmail.com>

Patch to support the LED mute indicator on the HP Pavilion Aero Laptop
13-be0xxx.

Caleb Harper (1):
  sound: support HP Pavilion Aero Laptop 13-be0xxx Mute LED

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)


base-commit: 1767a722a708f1fa3b9af39eb091d79101f8c086
-- 
2.38.1
