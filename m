Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075052;
	b=LKEaX8zStYXbN44QkPtD72uZE8b2SlIwdnsL+mFLDNxKCZ9lqXCwDTSAzrC01LATNlzg
	 XU7SQAvR/Pyw1yx+ScoH/nealwlIJp1al9fwHvut9XmeIgK7U0OwzZm9t9/0Y5iPfNNsa
	 f/76Po306UNTy1XPJEnWr7VXv71JzRyohYCchQ7b8utdUq4uI8VHJHNoo0vGycUhDWgj0
	 Kwi67l/jC/nIIcSaPDsPzHzc05gRkMWTwsWO6eyD1U+WrIhXm73Hue1LcEmw/DAY9K2Q5
	 jtxv8imw+lMpBGAmAVRPDgtpvUtpCs7UtowQXFKtdqE+7Yos4Amog7My/UUhx7MIUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075052;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tbMakxCkFZffkJNmfBCPnLRJiEf3Y3bhXNkOroKZq4I=;
	b=LPPl5Zql/sRWopJknNOz8CGIhw6Sym3wpNL/X9owRlwG7bVd5F92j87E5k4MAhgSc8B5
	 IEWmIy4E15t3R5E5mzZenNdJqHva9EN45+aXhsr8vEUNHSKVbR2ELOHFx5CKoRloEhgLR
	 WQIa8MgWqImfAHWXsq9cXHoW6rm+7YPBQXb6mbdZ3fzgeiUEzgMazUb0E3XQccHsNhXWg
	 iuDHEoZBGvAxsOYmldQ1TpufagWJ3g3iBmoeaU3dji0yuuvcBh8z9I9rubBiX8941d8cy
	 v4ebCbxLIwKIECb/PpHkCjGnQx/LOiAidFgoI9J11uutTolV5TwwrGCrni1xt9EF70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cGIjslHu;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5F9606A324;
	Thu, 19 Nov 2026 07:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cGIjslHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cGIjslHu/GN8S+E39GfnRY5WSXdmL4xdGEW7L6lJU9uPxo9Sz6FvzZEA/ogHgl9IDZ5iaN6QNCwQR
	 UdH7w1I6UWN9vjkPU8Zc9mJSQAoy/hiWjU5xTCAfTJx9/II8QGMbfMrYXMtojtKTC26AUNsGDIljwk
	 +G4/a7bOh96hy14o=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afeabe93a3-bba5d;
	Thu, 19 Nov 2026 15:57:29 +0800 (CST)
X-RM-TRANSID:2ee86afeabe93a3-bba5d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afeabe7645-5de6a;
	Thu, 19 Nov 2026 15:57:29 +0800 (CST)
X-RM-TRANSID:2ee86afeabe7645-5de6a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	mr.swami.reddy@ti.com,
	vishwas.a.deshpande@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: lm49453: Use DMIC2R Switch for the HPR DMIC2 Right route
Date: Thu, 19 Nov 2026 15:57:28 +0800
Message-ID: <20261119075728.50125-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

The HPR mixer connects both DMIC2 inputs to DMIC2L Switch. The
control for the right input is DMIC2R Switch and uses its own register
bit. As a result, toggling DMIC2R Switch does not update the right
input's DAPM path.

Associate DMIC2 Right with DMIC2R Switch, as in the other mixers.

Fixes: dbf7a733f5fb ("ASoC: Support TI LM49453 Audio driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/lm49453.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 8c36298aa6eb..dad72e2eaf9a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -813,7 +813,7 @@ static const struct snd_soc_dapm_route lm49453_audio_map[] = {
 	{ "HPR Mixer", "DMIC1L Switch", "DMIC1 Left" },
 	{ "HPR Mixer", "DMIC1R Switch", "DMIC1 Right" },
 	{ "HPR Mixer", "DMIC2L Switch", "DMIC2 Left" },
-	{ "HPR Mixer", "DMIC2L Switch", "DMIC2 Right" },
+	{ "HPR Mixer", "DMIC2R Switch", "DMIC2 Right" },
 	{ "HPR Mixer", "Sidetone Switch", "Sidetone" },
 
 	{ "HPR DAC", NULL, "HPR Mixer" },


