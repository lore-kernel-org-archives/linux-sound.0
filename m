Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982754;
	b=q/33VO1PDuJJXsFNRKbaqKIGAdW1aV5PqtMIoes8/0AESJpmZW2jXtMZE3PH/EjRb17E
	 RkUOmg/X88Zn/bACLcZTIO37p3H3rk0GlQhb9+wdEX33HhY7KN9hijZlHpk1ajG16p58+
	 sftm17LlUK+ETWtBWOWbVLxDrwiiKDOZp+G2JPnM1R/wMCdcUlVO6/22ftoA1xfXtTvYM
	 LeS++NjLNc/zr8cEqGRSPq3ecD2pWnFDOqAVb9FSJD0hposbNgPOlMCA2p15bb1qqPKgE
	 acdEZPT8ABT+n20r4uk5H4Pbpd8LxwW11NAlOIhheXECNczordzG+3uyC9je1t8FaTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
	b=G2rXelCuU3sEM/EkVWd3R/3CUP+tEpXEmTCo73552xoKpeZk9P047pmqeVn52c2WWQfR
	 lc9BPqiSbFNZkG3GsAuxoI4i1CEYc6lyi/p8ySnGEeu0Lfvzr0TGrs8ANXJiw4EQxrGm+
	 7PVZKK7ec567gNpYIkp/qZrww/wm33XLbMNnV/vvD6dxEFJul5SdNhg1OF1cWUzS8UhFP
	 SceLJPPVvgBSCMbKVB/Lbdksk90PuHqV4ZYPZCd7r5cHruoZFo1GL706nhMBcGOppmDj3
	 CgqNhlTiVrnK6f+CJXjNSHWkT32Jcl2MeP6RjlfyyQ9ZFcqflC5dszFx72Ayjc8HbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/V2FuDd";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEE606EE84
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FEE606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/V2FuDd
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8241a56cd70so564639a34.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982753; x=1794587553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
        b=U/V2FuDdEDEtf0+B1wT4SST0pLKV+HGGd6oDsQymSbHAm3iU1GikEmTVKVy1rc5XDb
         a2aWLDCh4UFk0goQV1fDJsXukBtJvmfs95xXAt51ZVsa2+LanjLb9v4PzxU8kLekXOEc
         kOM+2Nc6px6OVHJrU2sRzDL77BCHOC3CdBeweg2ReUOeV7d1rQUd9USV7A40tC6iHkxr
         46RY1OQLhm+2V0XnjjX2fJequ96FJrcTuHNH3Q7tyzabCZGPPfBWnePS7AorYExqSggm
         wRvlvccDiRq0kbdnXs6HyXwoofd52dvWDr2W1SYO2HheGd32pVYuhWGz63Ai5loHMOzK
         lAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982753; x=1794587553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
        b=ImLkf5GhfZgXtvFyueR5EM77kE8tNOGbuhPFdcMmDgMi+7NaxIYKNKF9hw2Y8J0+tW
         zHa41fFUzhvOuZ4olqw0dWewxIACBp+h9jJsHejuWWOEev9i3PVlZEX8gwqTFmtHfUMF
         lHYSX7ps6L1JX/N59bc53IlSJWhnk2Ev0dhUajyLg/m0nYz7qMC+it6sWDDHfm6D3kkw
         wfOHQCP+j4a4c5/6teppE4oGsKN/ZBAEFYu60f+5iTLuZm7H7Ig7cz9NV6zCtKMj+SIG
         GN3Rp7mt8wudIiZLz6J/G7HegHDSQX60KdWaKlXBkWtMWkEl2drP97haCVIW2VP2H/jW
         SEZw==
X-Forwarded-Encrypted: i=1; AKwUvBy7Nj8k7Ap+1KOwHU0w6yI4YtGBPZlIKZj7huXdcBlpgVA6kXShlDM8iLIaTdGTKlgV7ZRTaw0+pX281g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9K1NKD4wRJjQCDPkPa0szgQ2oVLcT5Wrbds95emPqdL1A6qQFd
	tlD32zj9p37iSDCi5LAxNSMVrg3/6LSKB58PJfAxn0Mr17D993AiSbQy
X-Gm-Gg: AYBFou3mYZZdYDeyohUtDwB8kUTxCkjbh0QNsGPdRC0hFG20MJT5j3vpuLGNrrYUJ65
	zlh9NcjlIpIToJsUawIBgX0HxlmnDbea//67Ea+vYF5tKa6yLWtCNiUeLtlsN2VnIgP4XPlaqYq
	vDsJNRjQDZvVSTD20l7F+gkH9mq6u2OUxLkS6o1uA1Ng0+VNGlmKrdMgqpoNbxcuy2SLPUvRvE6
	mUgxcBoB488NXLktTu8DNgM2CQW5NNBZ+yk/4P0TDZtlPDNCTRmptx4HxxiSbqIEMzJo8GNULQV
	23FAfqPUF6MthLpIQ2DRoFT1DWhvBFB/2ndm2n0tOuGF4/Db3Xf9pI6MHWCdhs/SdtTeGFVFeLY
	oKhDQyyQHCJw+lsTSW4TVlM9dCJgTpBBNCN3hKxxCW/0coDa0WGMVriLINvvEPjx49vWlQ6JV9O
	oaGMbsljIEC8LGBNK62Ft8KWVFvb16D01YnP3bXCxq07x+3riX0r/Xuz+PLYu34GK6AKTzXBh1z
	k5/Y1mglbRI/RJChzJyEWapiatq2vE0WLyPTAhqvRT2QOkTNXA7tfbsJpYHtonqg1z/PYqAotiY
	qv116uGTZdqjdmHBfaWjQ2ga9SIrvpND+M9LDrOdT0l3NQ==
X-Received: by 2002:a05:6830:314e:b0:823:e626:2764 with SMTP id 46e09a7af769-85f1cf83852mr3451308a34.5.1793982753115;
        Fri, 06 Nov 2026 08:32:33 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:32 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 09/16] ALSA: mixer_audient: Add readback-free parameter set
Date: Fri,  6 Nov 2026 10:31:22 -0600
Message-ID: <20261106163129.1006907-10-mrwillporter@gmail.com>
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

Add a flag to systematically force parameter writing without prior readback
to certain control types. In preparation of the id14 driver.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 70ec3274a5e4..f61f9fe61345 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -39,6 +39,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
+#define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -313,9 +314,13 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 	int ret;
 	u32 val;
 
-	ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-	if (ret < 0)
-		return ret;
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+		val = !value;		/* just make it different */
+	} else {
+		ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (val != value) {
 		__le32 buf = cpu_to_le32(value);
-- 
2.47.3

