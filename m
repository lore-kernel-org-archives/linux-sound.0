Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F358035298
	for <linux-sound@vger.kernel.org>; Sun, 17 Dec 2023 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl+YBh5o"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e270639d9so1234114e87.3
        for <linux-sound@vger.kernel.org>; Sun, 17 Dec 2023 03:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702812407; x=1703417207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3lVMsH8UoRgnBtgpntj+M5tKaip7JAu7tlcdkLjQ6o=;
        b=gl+YBh5oJ0peArAXcg0YfJrnRWjtkYKg07tzMaxh+e/1TSOv2jJjVvcQ49vhPUWX0v
         CVBIxPEYKL3YSxNPihH7EqW0H4Oje29AFc0TcIpslHTjxvrZEBrqWqoSJFPw2M8B5gX0
         W3MdRQ4IKs6qBzzwPRg2pKxa2Xc95hMQwZuhXoI52Z/+YXH61n3RkSkpmJ7DECl1yWYU
         ZeEE5cKup2aekJuEwRJEC2bn4QBs/zco04PJoR8PolsvDo4YiTSHgzwsfpmoZX4P3yZ6
         RBskA3HQlFrBnws2qqiXAihxk5yL9twPYKO1atBohqeIiorNeKiFQ4x7S95zQ1SCfloA
         RTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702812407; x=1703417207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3lVMsH8UoRgnBtgpntj+M5tKaip7JAu7tlcdkLjQ6o=;
        b=h+9xK/u5UJWvhTljtqagYv7sqLTiV/9UFY4xD6iqnMtqDDbi5pl787+fJjxLHw33BZ
         5IANoCwjXmXyKXqwzusE7RsffKf0buXIBPACoSWBW+RFBBQeomtdI/ROwO5Q9Pa3yYN1
         Y8Hy197443X093TcC1KsUw2OByzpDSSQ44wCnkaQTgNpRNm9ePqCYNy/EQtahY3SAZYr
         vpaCa4aHmdViRD1ybMvHcq/ZVf/fLUOQ7WiH08MhBUCkrrPFLkUhKCMdzioHp5B8Vlzt
         TnUYEjioqbCnxJzUxZnDy/EfPV7fgTULOeAwA794aQXDw5Y8ZkH73/6iqL20MLcEeWBC
         YnEQ==
X-Gm-Message-State: AOJu0YzDRi+ERknUhyDmvWX6XbvLpbc1S/bkZW1destb8TmIMJQzJouK
	csq0yZicebH37Eiesu8fwS4ltPXUs9I=
X-Google-Smtp-Source: AGHT+IFfKwuviM4WlMi9KUdTEwFg5AVQNWVQ6NecQMLCHo14yuVdz89xrMPD/MLhndj0NbM5i+/E0A==
X-Received: by 2002:a05:6512:48d2:b0:50b:f2c5:56b2 with SMTP id er18-20020a05651248d200b0050bf2c556b2mr5854205lfb.47.1702812406358;
        Sun, 17 Dec 2023 03:26:46 -0800 (PST)
Received: from pop-os.home ([2a02:21b4:100c:0:d2cb:c50f:dcb0:5076])
        by smtp.gmail.com with ESMTPSA id ig8-20020a1709072e0800b00a1c6e3e454fsm12778943ejc.166.2023.12.17.03.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 03:26:45 -0800 (PST)
From: Jeremie Knuesel <knuesel@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jeremie Knuesel <knuesel@gmail.com>,
	Alexander Tsoy <alexander@tsoy.me>
Subject: [PATCH] ALSA: usb-audio: Increase delay in MOTU M quirk
Date: Sun, 17 Dec 2023 12:22:43 +0100
Message-Id: <20231217112243.33409-1-knuesel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the quirk delay from 2 seconds to 4 seconds. This reflects a
change in the Windows driver in which the delay was increased to about
3.7 seconds. The larger delay fixes an issue where the device fails to
work unless it was powered up early during boot.

Also clarify in the quirk comment that the quirk is only applied to
older devices (USB ID 07fd:0008).

Signed-off-by: Jeremie Knuesel <knuesel@gmail.com>
Suggested-by: Alexander Tsoy <alexander@tsoy.me>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=211975
---
 sound/usb/quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ab2b938502eb..07cc6a201579 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1387,7 +1387,7 @@ static int snd_usb_motu_microbookii_boot_quirk(struct usb_device *dev)
 
 static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
 {
-	msleep(2000);
+	msleep(4000);
 
 	return 0;
 }
@@ -1630,7 +1630,7 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 				  unsigned int id)
 {
 	switch (id) {
-	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
 		return snd_usb_motu_m_series_boot_quirk(dev);
 	}
 
-- 
2.34.1

