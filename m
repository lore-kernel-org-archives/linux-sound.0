Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752757;
	b=zQEsWB07FT1o7MvrjEaYuLiiP6oCcaDSUGYPf8o/x5yncsS5i5SGQqsaQIL/CS/LUjL5
	 EUN+FHmR7i2eD76XSJz+REs9goMJQUbI/a5TfP53waXPQdW5DGfXIwiDrE9wNOP08Ozrr
	 BcOeojvRUMSF6ad1V6ekto/LGT6Ct/vVQ2ST7YM6Ej3pozMH6O3FSW+xFwkdGVxBOIV50
	 wuacuvPkd3t4dyd3eOxDf+llvjDMQ1r41n11oHk6VQSCLopxTp1UmhePxtDK7fnKcIbbe
	 YjskRMSgFBWDpOuV++bfvJAwlLfKSi+dx8d1SRtnXDzVq4hFBeWZcA2tO+KOxDi1MXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
	b=OxkjyuWRPPwx/hRtSUsz0V1bB2Ij4pnwY/Mg7UpsoSdskGIROof+fCtoa6LkY8b2pR6F
	 akR2YdPcezhpFGnsyRf8K/WEMbZ1icKqHJD+FKilTe/PRKABnHmtA5NKEYAEw08c8FeB8
	 x5LMsKlyoaWWHvqt3jShQ/JseuRngneBM29umYYm74bG+ofo2mrNOqafyIRgiIOsknFhb
	 dMvzV0hLsoZrXA9y7xcFVf8/NCpuSpQRK9BZ6Dd8vSx1kflcinEm4b/s41YCfXVv2Nwxm
	 LwFBLAauj2s6aYVWS8BoaiI5bBjdNGRKGuwjbIg65QaHIi/IxaoHWPEtH/yqKUQ7BTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKJu2mC4;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C34606A31B
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKJu2mC4
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1349450f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752755; x=1793357555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
        b=gKJu2mC47aDv5AW84RsaoI0pS1sDh8ljzENd8XmJVUqCLbFFCydF1Xj8mYJkrd2sjI
         4i3KRKFOeogx7KeMWiZjyx+kU4HOGnjgkTArjWkGEYOEAhOO75yk4b3MnX8eHjfBds6I
         scU49clfAygXNIpFuzjGG7ZR1uK1/tXF96xb/n9kSc7/f/1mIWxNXHvzXovKxJzsClRh
         i3wV7bACzpbLRLpAHPmHvnlTg2K6bvICVaMlmq5jCDcTkjo1wiQIV3yL5N2IqNu86JLR
         57v1a8TLVjyPvE9ap2cwKl8UmdwB+0JAW2GGc/nEteB3VOxslHTvV5vDYCqeVadKjPCk
         Cavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752755; x=1793357555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
        b=0RodYaijTXfZgZUa33+ceakgpl619dUIPvw/6jxibk1xGaigXJxkt0GhkResyARMND
         xfkhj/FDORoixlTr3vKjUioTXmn9C0RNMBqjQs7sBhUsvAE9UYZfdOQTNDN9c7yzM+ql
         Iivr1fCV0Q3DWUn8CAHhbGPR9SmS66FmJCg66OuV/AfzKzRzLpMS+x7EF8NrWmvU2fb/
         Ssg3Lk594aJzjiF2DGbWMhhKa8OpKAJRUBEjyzpsOK/Xl5YaCBsKzd3qpMTn5u4eKojP
         5YUXLxeIAbhSq9larwILhgfP0da1XYDUQTFt/A+GsFlJiwDoz9hgewLy2ijATrGldZDr
         lpVQ==
X-Gm-Message-State: AFq9FYK1fHPBlnSOLNCqPwfxqpOi05qPKleV5nKI+ZcarJlEUp1EE29u
	pfmCZ6yTkNR1rAYpZ9MJAd7AFhIU3m8Cb8pnMMxFMh1Pv/ngXs/VkxyX
X-Gm-Gg: AYBFou10lhBjtsN7aWow2wga7ZlafUhZNTnEdoAYE0fPZQ5RJ7uSlKu3/tQNqvtSugZ
	+MMOkWR4Sl8kTRDUxGM0K4KNUmO1q4N0XQxi5+SV3OfRlsXIaWmEdFuox/dnIkeOXJrV4oDMCyk
	VDs563IIu51glIbHN7CVI3B1iBNqqHHoyWECWIz1NLw6cflaYMih+pLqPHTQUM0yYSYT736ZtDZ
	0TdjFi2pVDly2YjoUKawYRVYbpuwUHQ8Y5Aq4pcU0s6J0NnSWe51w5cu+pE4Zw28K67A6/j75kV
	I3diIriQIp3/ZzuPe0DkiWc/yNrvBkkUfFrpyDl0GfFIkWPvPDiWswu2BRju6iUb7H8hRxDe3ZN
	9ttc6rcD9TBVfPt5GbtjmUSaSvLOuiAIxtgaz7Syu+utOTL8TuoRirHE2IlQkn1QvDg+MYbCtP8
	aRblIjhIPFfEY4whKnBXumfeBpJv21g0v1ZWSLH2D+Fjw22/pHACicIrmZEj6Sl2jmvgnnqgEc2
	+r+u2HBqC4jR8jQEIrdy7tCS+ZvzvpDx8h14eiw5qJFZvwH8gcmfP71EUj5+9xAhw3hg8hHqYEm
	wdzxjjs=
X-Received: by 2002:a05:6000:2f8a:b0:48d:fbe0:62e1 with SMTP id ffacd0b85a97d-48e2d278e85mr10121108f8f.27.1792752755385;
        Fri, 23 Oct 2026 03:52:35 -0700 (PDT)
Received: from thinkpad (46-138-54-86.dynamic.spd-mgts.ru. [46.138.54.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025d76sm4282184f8f.13.2026.10.23.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:34 -0700 (PDT)
From: Andrey Zakharov <dedemorow@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: [PATCH] ALSA: emu10k1: Pass destination size to copy_string()
Date: Fri, 23 Oct 2026 13:50:27 +0300
Message-ID: <20261023105027.53135-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
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

copy_string() copies the bus and input/output names into fixed-size
arrays of struct snd_emu10k1_fx8010_info using strcpy() and sprintf(),
and it has no information about the size of the destination buffer.

All source strings are static and shorter than the 32-byte destination
arrays (the longest one is 20 characters), so this is safe today, but the
safety should not depend on the contents of the name tables. The earlier
strcpy() to strscpy() conversions skipped this function because dst is a
plain pointer.

Pass the destination size to copy_string() and use strscpy() and
snprintf() instead.

No functional changes intended.

Testing: compile-tested only with clang (W=1) and sparse (C=1). The
function is reached only through the SNDRV_EMU10K1_IOCTL_INFO ioctl of
the EMU10K1 hardware, which is not available under QEMU.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 sound/pci/emu10k1/emufx.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index a33817aba17f..d49866d9961e 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2423,12 +2423,12 @@ static int snd_emu10k1_fx8010_open(struct snd_hwdep * hw, struct file *file)
 	return 0;
 }
 
-static void copy_string(char *dst, const char *src, const char *null, int idx)
+static void copy_string(char *dst, size_t size, const char *src, const char *null, int idx)
 {
 	if (src == NULL)
-		sprintf(dst, "%s %02X", null, idx);
+		snprintf(dst, size, "%s %02X", null, idx);
 	else
-		strcpy(dst, src);
+		strscpy(dst, src, size);
 }
 
 static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
@@ -2446,12 +2446,16 @@ static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 	extin_mask = emu->audigy ? ~0 : emu->fx8010.extin_mask;
 	extout_mask = emu->audigy ? ~0 : emu->fx8010.extout_mask;
 	for (res = 0; res < 16; res++, fxbus++, extin++, extout++) {
-		copy_string(info->fxbus_names[res], *fxbus, "FXBUS", res);
-		copy_string(info->extin_names[res], extin_mask & (1 << res) ? *extin : NULL, "Unused", res);
-		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
+		copy_string(info->fxbus_names[res], sizeof(info->fxbus_names[res]),
+			    *fxbus, "FXBUS", res);
+		copy_string(info->extin_names[res], sizeof(info->extin_names[res]),
+			    extin_mask & (1 << res) ? *extin : NULL, "Unused", res);
+		copy_string(info->extout_names[res], sizeof(info->extout_names[res]),
+			    extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	}
 	for (res = 16; res < 32; res++, extout++)
-		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
+		copy_string(info->extout_names[res], sizeof(info->extout_names[res]),
+			    extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	info->gpr_controls = emu->fx8010.gpr_count;
 }
 
-- 
2.56.0

