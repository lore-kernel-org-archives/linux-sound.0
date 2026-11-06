Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982750;
	b=sMLkG344mAzT0OenBszorgorkLdfY8Ez5Um3GH5GI1uTtXEB3nakQlXHWfxG7ubfezty
	 TCBsOzWBeb1vcOY9tqr4IxQkcKWsc87v13brLmqhe4KMuYXYG1Od+9XUV79TgZItISJvr
	 GkSgV+4uAAmJfyH6eO+KbqsQ04GUvYKf9Tfd3i1Yu2LsZ8MNadShf+RMElwSXuKJfd/GC
	 oNOFYyUWoCki9JIQ9uBb1zjNJMgvC2g7icNUiPQ2onD8y0DrXEdBfxKzH4i3JC2yYJEaT
	 h9Ej5508wYbKWbclA7oavyLuwKKEXTgNno+cNijAdGqE/KurfE+LA4Wkgmjza8ckLaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
	b=MR1bch5rgO4NK8b+5geEGO7IYO3V+59Gtxlm2GUOW+q6TxhP4WYLLKnQ0mh9MedPIzaq
	 QGxw2BZV8vsnTL+eg4ixfwARseirBQaXoGrCG8mwX120BULkS89iN8y4kNFu7vguOHGos
	 1axN+OVoG0/LJc+HsDfgXfm2Ln0/CEc83+NGYbB9vEnwfb8EREyl4e36YZSVUI2NXbJ3z
	 yNK+1VG1+MVE15F+9RnKotOYoh5LH3W6XPpZRiZMJ3JKwZ9u8keFvH40mhWYBDDFNL0Z2
	 KoWskF05id7Nk/W/hjzkpQYPsh5m5mkggjFPKroDNdhtKw21Sskp4gFc9W7LEsB77sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oahrWZce;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB5606D812
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADB5606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oahrWZce
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-846566246e8so763145a34.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982749; x=1794587549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
        b=oahrWZceGWiYZFLpDjzFydDBqqLTgh20Jvk0ltgSwlv8nFSqBbM05J0ktdW0wp+gQM
         rf5coZE7/02q653QDtNOO6qJamPqv61QVGq1wLUNs1CtQRsHXbiUwW+827VOMzW+Sj5J
         qChUOi8UpWl0pbbLNaod5VO/V8ppROV7q5VNfZhMcyKrTyivFAJp80h1Orztn3GmkpQh
         SUK1saDS/p8iSE8JFJ3dBtVHGjOlqDILKRXuQ5w6dZ37Y0lQxVt97Vn97fIGkG33T08C
         KvyD50QG6yy+Q8YLutzVRd7a0ZdapJp4aWU1KtMfHWtb04hPq9qtyaeQIwcC5GiVxoc3
         zv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982749; x=1794587549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
        b=RsxvnBnDFmSBgelGx3gvxR6AT997cpllNpnGwlZMBklxjZdtEs752MTQNs7oiH5llY
         N/YEI8NlzQm++hlRth2L8uMMCw7LvpmWYFEgmZQ/E3Rfm6jGijaqir0LKHxH0v+PQC40
         ssJwIGbd+HqI0NCJoTIrUjmmAWtqqXmLGSZhgpBlHZuSNOWps7F80pDg9/S09229HlPP
         NgmdJEZUbhDFTc7fpukgfQIm9UUbGxmwx580n1/8gu3tqDYul0ZYuNkiRuoMB/H27iQ0
         izyul0VGPilwB7EVdGD4viCpxJt2DpSSnamdBtmuyhm5oNRWlLxyCtxt/NI1iZuhWtua
         FkIw==
X-Forwarded-Encrypted: i=1; AKwUvBwefRR8jU+f0pTqw249ilm+HrDhA/0Za4WuYjehN0Q0XytC9863j8jw+d3zo4vOzp+2tQr998ctvb3QYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jZnjQZbwdh9aEPBFXfO3nwxD80XwrotIjUmYXMdbh/OkC3oZl
	y/wAyL0288x6EtLBPpcllUNBvjFfeLesNBb6POP4RRG+BIU318Lx50Ks
X-Gm-Gg: AYBFou1O0ma/oEce/YOkpPn4xcPCy22kG/uD6K5W3GGDU8zKMeq9tkuIXeZ70owSGUy
	16YKFnD2KJgnQ8100YT69BeOSiOiAnZu5CipWmU7koBpd9jWBepsP0u4KU8wlVMEH70q6N7Irxi
	500Z7gGCRzqs3xp06ai8Z3MBZ5itB3b8svcgX4wJOB2oZWFLkO20yOt/2YwfVU92PJExDdM1Ivt
	ygBLzGfJjd5CAHetzpdLgIJS9ablEv3MrMHzJP7JAeUGAT6M3iQDVZikiYtIKb5lnkGkMK0iCci
	/VcoroBNw0LnezKBprpCNwxRweCaNs6aMBgrpJASMufeprrwtkKolIwP/HlH1kWpN/Go9cvOehd
	xRT6EjHLh5OULWKzFz03iHKbsvIZ0dJFQTHqRjF/b9lnJa9GFsAZMIBOu5uCbMhA8z8TtxWqLWB
	8MVc+q+hnxdLKO7FSXw182QJ7b/FPvpYaX0xzUzylCTBc++rWLf2p++7S3AhUWt8Famd0Y4tmym
	8QVfnmXPAiYUX5puL9GnY72+MpG6JBQVW+nF5Ivu1EU/L+edsTEwIy7Lo7T24Krq5SBfi4U6gqA
	kJ3m2shbAJ2uymkwtY130XjumZfJZOpceul+C57gaymflQ==
X-Received: by 2002:a05:6830:442a:b0:846:9414:ded with SMTP id 46e09a7af769-85f0562dab4mr3897698a34.5.1793982748814;
        Fri, 06 Nov 2026 08:32:28 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:28 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 04/16] ALSA: mixer_audient: Add length check to USB transfer
Date: Fri,  6 Nov 2026 10:31:17 -0600
Message-ID: <20261106163129.1006907-5-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Ruppert <arc@gmx.li>

Check USB control transfers not only for errors but also for expected
length and return -EIO in case of error.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 63714d00592c..1f3744a7c10a 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -244,9 +244,14 @@ static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
 	const u16 value = U8_U8(sel, cidx);
 	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
-	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-			       value, index, buf, len);
+	const int ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
+					value, index, buf, len);
+
+	if ((ret >= 0) && (ret != len))
+		return -EIO;
+
+	return ret;
 }
 
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
@@ -258,9 +263,14 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 	const u16 value = U8_U8(sel, cidx);
 	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
-	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-			       value, index, buf, len);
+	const int ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
+					value, index, buf, len);
+
+	if ((ret >= 0) && (ret != len))
+		return -EIO;
+
+	return ret;
 }
 
 
-- 
2.47.3

