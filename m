Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA32C3278
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283972; cv=none; b=DDlf74U+BvAgFh9M872kCHsCS9VxxPNqpDvL98VU1LWcErdd9LsMb4EdJNOW2OPaOUkmA7DukRHO6j+Cr/tScth7x4QpKZgsEsT1B9pUDkwP3WllWRU3SX3IARQrvIou/NIcxDcsJpeKWajc2092gMCUr1scpQWutZ4NByBrH8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283972; c=relaxed/simple;
	bh=ij9R11PyDi5QFI7rqK08JwGropXGV/n9W6IHY6U1Ewo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeFUHpoJrfRTFjm0QVETSn7lyKHWm2ibDjXxrnIGP2YWfe9IS/S3wQJoDbsUkerWs6/XLs1IAB1pHFngn4aK1Aemgh18/tMJsfHYa4+h7RTVRxI0umfWPLQ/sReJFAQt6o9DzORtd7sEMM47E3vcc4iwBpSuTx1qhdhZvXtqurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=If0g2Q6e; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="If0g2Q6e"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so7948216a12.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283969; x=1765888769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YexG6idkXG8kHaXjEGXkuQmv9bZY6cfMxNi5jJLFw4s=;
        b=If0g2Q6e9aONf8fXb4W6qCpcMlXBUfk0cBQmHSMnIG86zDc/7ug4dSGSmsBjks7Cuz
         lRdJOSAJnYaybCyTT8CKlkgqGvNfQx0mct94nAk0qiq5cEp+VCYPJKwxctsXEkQhH8/V
         S0V6U9UpU2rYuMzD5WumfG+aP+dQxfhYgYjix/mKCVwUH+Y11bQjytB1kK3j1atYDpZZ
         rxzZKlsmSUcD3O91KkmqoWIMxX2ceo8j2NJ/32Mq48ym4PhPatbQ2iFk9Es9bLq+4w5w
         NA62QD7RHO104oaR14JL5dYbi/njsUUeNoEZxgbJdw9z4Mhgg2sEL1t4n/784w2bmNFB
         aX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283969; x=1765888769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YexG6idkXG8kHaXjEGXkuQmv9bZY6cfMxNi5jJLFw4s=;
        b=YVq5yxoa+YoY3AiuFLuJ3Uyxbi7Yo1lu0gVSBI7vL73dhCCp72Q+2296JxuWhxksbt
         GR8dEUepRrWYca/IprXdnzbSo3Pw/MpPc97Qkn4XEg9LC80/FdOkdOSFmlJaRnVfrPqC
         1wgmNrenegassE7/2cqSLwb+tNfRpTVMjIR3lD8ZF9EXHZd9HfmZplGAXCTqB7GaUa8+
         jumCtehINoFpDURBkUNtnpswZMlCX0wi+XUQyChMRbFE/DApT/Z9PhWBRvZuAEG49XPI
         7qKzR7LHHYwpVLHhh0xZHz2UGXrRwgwybcByK71A6OqWgePYrK5fp2nHw9L+Q/61eq8v
         mUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSM7+vKXwMChgUhSTXso8Y4bbN18dVI/CJvP60pn1MaLUC86LAWHdANkWc0FYbmQGrAWn4UUYEAIokug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPt0hwUowb3du4ie2Qa8fnLg+kdUoPLeE2ARvMzsziJI87u/3q
	RTXCcLReuq5Z8usAkQtNZM/qAIkoNxd6N/pOYE1vd+NjeYcuYR1D3Bc/U7bpzd8lSVg=
X-Gm-Gg: ASbGncsXgNsyB8Lcu89yBT2V2LmvCOook6Fzg8fExV9I/DIeHwmsZve7XvD/erU6J+F
	b3MNLqdP4dEBNzI4eA2MtjgYw044Z93jmKx6OLnneoK/VS0ud2AyU+CWpBd/b+BVrEMddvrDcFE
	wqAQzg9bITq/HizzaH04Yv9LAAgkHOc7o3EZei8WBk79Q8P+D7tV2CxhzWq7QZCgZKqckAlWZbf
	JZ8LQ0kbntD5ruXAoyjCJtNaKP/YxYKiXlSTiJ0EqqEASH3CVRUehXgdJCyxsksm0lrlsantp6V
	dr3vhDsi/GWSIZXglLi98NvCF7hGmIM4yRqc6DecEpTjbyowxdwaw0XOEznnHGIXSET5BKWeWSo
	V+L0x5lvVxDl620JS9WNArx+gGRQzEvt2HF8Lf8IWflRYocYR20P5YQaunZeGknm7hHF1wLnfC5
	lQMP9fIvdPT3Bf08nu6rLvXC5ekMUYbxehvgjsEfS34JLbUImSDWtCXNJ9DuTjklbKzVmJ3lg5j
	3nvyjWJYVe11w==
X-Google-Smtp-Source: AGHT+IHr+DIMQRQGyJv6ZfpobwpyLAiDFAdWsBM9f+GhROIOWJ7cL81WEZZ2WNukedGNbB2pMxxAoQ==
X-Received: by 2002:a05:6402:144a:b0:647:72a2:771 with SMTP id 4fb4d7f45d1cf-6491adf5cb1mr8672848a12.22.1765283968748;
        Tue, 09 Dec 2025 04:39:28 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-647b2ec2ff8sm13620927a12.7.2025.12.09.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 6/9] ALSA: sb: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:48 +0100
Message-ID:  <ccaf10073a6e8a68ea751bfc0e8aae1c66b57458.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ij9R11PyDi5QFI7rqK08JwGropXGV/n9W6IHY6U1Ewo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhk5QpJVAnR4hCkjSenTw/uLRSUfDJTMguHn efD2sHOR9KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYZAAKCRCPgPtYfRL+ Tq8MB/9Rx/vAqP34i99BzO3Bt2LOl7M9fbWtNesSTZanB2zzZVp8+ecJQGvwZ3fbqexGzxEorCn 4k1AdXPmIVblE5EJrspoltABd0L5tqsItU0rL3Tdj+/Mk38hzi+rddE895fXCArL0a92/K0xiy5 0GSo09sCrkoY9xzp9MPCk6CwFgVVu/lWqmsrH8AKBQR0p8Frdvil0LSqdjSmzrfsC1vkAYbFeKq w9+w/Zk2dQ5+o3uf6wznGDjOmMx1JKz2AFa7idMfXISaouej3qlOKPxuby7u84CWp3w3wtDEm1C hWQg3T66WC3yy2PMY++3UPBvtMkgDhzE71RqvlrDjwPQfWsr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/isa/sb/emu8000_synth.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/isa/sb/emu8000_synth.c b/sound/isa/sb/emu8000_synth.c
index 9bec85ec55b4..3414c6d0695f 100644
--- a/sound/isa/sb/emu8000_synth.c
+++ b/sound/isa/sb/emu8000_synth.c
@@ -21,9 +21,8 @@ MODULE_LICENSE("GPL");
 /*
  * create a new hardware dependent device for Emu8000
  */
-static int snd_emu8000_probe(struct device *_dev)
+static int snd_emu8000_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emu8000 *hw;
 	struct snd_emux *emu;
 
@@ -81,13 +80,12 @@ static int snd_emu8000_probe(struct device *_dev)
 /*
  * free all resources
  */
-static int snd_emu8000_remove(struct device *_dev)
+static void snd_emu8000_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emu8000 *hw;
 
 	if (dev->driver_data == NULL)
-		return 0; /* no synth was allocated actually */
+		return; /* no synth was allocated actually */
 
 	hw = dev->driver_data;
 	if (hw->pcm)
@@ -96,7 +94,6 @@ static int snd_emu8000_remove(struct device *_dev)
 	snd_util_memhdr_free(hw->memhdr);
 	hw->emu = NULL;
 	hw->memhdr = NULL;
-	return 0;
 }
 
 /*
@@ -104,10 +101,10 @@ static int snd_emu8000_remove(struct device *_dev)
  */
 
 static struct snd_seq_driver emu8000_driver = {
+	.probe = snd_emu8000_probe,
+	.remove = snd_emu8000_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_emu8000_probe,
-		.remove = snd_emu8000_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_EMU8000,
 	.argsize = sizeof(struct snd_emu8000 *),
-- 
2.47.3

