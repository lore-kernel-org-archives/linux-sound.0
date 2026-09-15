Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836BE470E85
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461907; cv=none; b=MZjGha8sQFY4I5MwO5Dl5XaDfCmqrDaKKvjx6YYX6L/ClytrKaOXJ1GBxsOkoGm8EZzw/OCohSNo+BBMwRV7M3G2vf8+tk00EWk3V9LvkUH7LQ8q5PU7D0aZp8TRJOzI67BYGu/l9Sdmn4pFjRGnTX2YFKZyCkadSKKQUMrUYvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461907; c=relaxed/simple;
	bh=RHzNvqHH6g8dxLPMQCx5vAHqARTvX/NfooukUqZlNO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFkOR86XKW+NOX07heoNUo9KXcJgkbT9c3HmNwVdvcz4jqCR6lB7k+AYkUPrNsHrxa+rE+xb732D4CDd3aAHLMm+bVRqCwcmBr4SioPMZMOOd2JK43aaFOTAwj67xLMjXeXbF+JHf6qWD0Aj6xgXpHfu7YtiR0N7mF81cIKJvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhDFZRGo; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhDFZRGo"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so2122063a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461906; x=1790066706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4ORGj7QhARBNh1I3ctDZ1pF9XesF5Up1N6MOnGbSoE=;
        b=fhDFZRGo7nZD3EHSXCIAh5q9k0ap8pyMG0ZmZMzij17bWrFGWux2rdOjSr8wbX93rC
         DAgWCfNbLWkyNqWIIvilWREDtRzIUY+JLQfXLIlIXxJxsjUsT+jLmVPFUWZhFzULojg2
         h1TWlFSIllfV9v8YEa93NLIpJ3GFS7beVWaHMRPUGOTjFNhdjiTaTIUsnWVUZTX/KehL
         Ee3+HjK2qBkG2MPQBohN7np9mXDh5aklE54rWZjpO3FqswqpnzExzWbNMedTIXfwBWdq
         TcQb8j3WvAEdPHrBQrXVaPAzRKLNn0j4z+5ETpTbM9XRgMc6pZbL8sRjc2fkDsv79jJ+
         nlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461906; x=1790066706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4ORGj7QhARBNh1I3ctDZ1pF9XesF5Up1N6MOnGbSoE=;
        b=rmddkexCr+OKFz9GJWJOfnnGNKmydtNvaZ4Tv9ZBJidps2NsLz0RbmMfFaHLPEjzOb
         aQ1AwZB+by54xrSTBGz9Cv2+4brHwLKtRJmjUrx659rxX0pSI6xD75tmbdpm6TZf26Me
         8Sw7tp5T2zCeeAtS4BA1gW0UZm9RK6UysLtKsxd0qN8Ab6POkkKfcF2wobj9C2JWjWcb
         POQS1GCIsj06CrbQYMT/lGoQnVqHd2+zz9pbnEx5tdCkl/9xPCa6s58y6+Ewscy4eoMv
         33bkNbJICuahFDDQl1YsOj7r9F5MovyHoyWw5jpVEalzIsMpydk/XnCHKXcn1ZepzTVZ
         PDdw==
X-Gm-Message-State: AFuF++nYFIIPa6G1cfDquq4XUVmKJGfw1lTAs0dAmR/l+mFMLx8KkPVy
	zLUz5zyVsEZD2WW+TfqUlKUcAmBpl/huLrpNuo/WYiSw4HD6wIn9dLns
X-Gm-Gg: AYBFou0w0nufjJ+4CDP4+LQ8BUQX46EC/NmA9QdCyf0YCQybikxFeDb2fxihh7HE1qv
	8umlGHPbz9PbBaMHp3sL2T0xbfTZD7xXz1wxEHdHmHCJz9n3uH13S4EJ721ouvHxh0xVF20xPWQ
	opail6mVx7e37eE2p8LL4zOxJxyq87Gk/mSxyZ0pszWRIU1xgf3tR91fvOB/9nUZBS48IoQMUh8
	Oy5QhejeIoEqAIFJcZ47aqw/ViamSZlQiTqoFVFaiRGATMXx4ucXAL2S4V6sR/kxB12PbfWLoWp
	aKSDMtxhId/EBHtTzOHfOHa5yrzMt6XU6eJ0D0M3SJR3CNjIK73Zd15GEuZFLrVwE+8mX7TA45J
	W/1r0DOBkNNz1Rsswugv0xACmga4qPECiJnBVV4WYuqxUSMituhEUnMv8+PnI9WEsJ+qtCtdd9R
	dg/XFPfoLjLv1n/Y0UxZhHv+RyfWNFcYLrHu+wVZpUGDMg3Ic/Qs6O1EE8ejp7ehLj56Fpp4eM2
	/bMMsAjCkpdRpabcGSZLzzyhOv1mc8XjDn/
X-Received: by 2002:a05:6a20:ce48:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3db404aec17mr15079637637.7.1789461906035;
        Tue, 15 Sep 2026 01:45:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 13/23] ALSA: aw2: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:14 +0530
Message-ID: <20260915084424.1007757-14-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/aw2/aw2-saa7146.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/aw2/aw2-saa7146.c b/sound/pci/aw2/aw2-saa7146.c
index c84f1a45194f..6857a0ec2924 100644
--- a/sound/pci/aw2/aw2-saa7146.c
+++ b/sound/pci/aw2/aw2-saa7146.c
@@ -147,7 +147,7 @@ void snd_aw2_saa7146_pcm_init_playback(struct snd_aw2_saa7146 *chip,
 	unsigned long dw_page, dw_limit;
 
 	/* Configure DMA for substream
-	   Configuration informations: ALSA has allocated continuous memory
+	   Configuration information: ALSA has allocated continuous memory
 	   pages. So we don't need to use MMU of saa7146.
 	 */
 
@@ -204,7 +204,7 @@ void snd_aw2_saa7146_pcm_init_capture(struct snd_aw2_saa7146 *chip,
 	unsigned long dw_page, dw_limit;
 
 	/* Configure DMA for substream
-	   Configuration informations: ALSA has allocated continuous memory
+	   Configuration information: ALSA has allocated continuous memory
 	   pages. So we don't need to use MMU of saa7146.
 	 */
 
-- 
2.48.1

