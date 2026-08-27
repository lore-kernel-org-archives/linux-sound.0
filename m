Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F03DA5A3
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872915; cv=none; b=LtvAWViV5FpS0gqBPAXiKARzXMuBePhSYPr6kTOqawznhPnNI5VtOJMYegLm7+NvCehzEU/ARde+GxVULszLt6wupOmE9bogT2NmrlxaHpU8QjG6748qit2T1CeCu4GGRV0KANMxAFimTcyg1/f4HIbPmg/Z+bB/Sq7LVlDfcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872915; c=relaxed/simple;
	bh=OLkbXGYyZcNfD8UAT3yY0FeWpmQA9tPNWZT8QqXTR5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n90BQBVRxC1kFff50E3XryuTwGJvSGZhC8+arLEffoepUmGXLlul0zYvYtdO90sSjCCQOCj0V4KL7ULwSuJTEX0Vkk/gA5Ir5WeI7wFl2uMRPd96S5p37JH/x0JN6JPIzL8KEF0E0xcIbW+S0Qn/7U2Nadfgduq3FDvilZEKfEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsxmOnSU; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsxmOnSU"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso331259b6e.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872913; x=1788477713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJk/diW7vSdlaTCy9g9nUpmvVfpgQ3VliAsH0dOI4Qc=;
        b=qsxmOnSUKgj3p72MdbZKM3WmK2fGmksvR6rrlVv+ZqGNQzxBsKrkFsyrSDFmuaDbGs
         8qLIMLNuwWWwzFT6kRLMMY818j5rrvX+PJsYctEHcG0MDCDA7jdHRHyr0luD42qQRLz8
         C4CZffChCTb5zW+2yDu7i9i/PaTVgRJHKdU/3kVa+OPHicxDFsuMZ/5oF/f04LsDmh64
         Bgc7npDvO+8ZF/V8vPMw4DLkbnSV3sOTdly0LufwQyJvzqCAkNLJymPuKvMbTAAWRl5y
         5EdfYhcknwDTqSph8ZkU2vWuHyAasQ70ChWws5nHFlzWFDa6cc6wzoQqy9R0yJILPOFK
         3nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872913; x=1788477713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJk/diW7vSdlaTCy9g9nUpmvVfpgQ3VliAsH0dOI4Qc=;
        b=VUrtvGufYiHqP8Fe2z25rLdF8pCLYvAcACaA45StcGQhh2M45BkNpumjScpD6/cnMm
         d86VHQX1EgN1P9JhbbjmI07mrt02h8MYbvKEJq7ulXGN+hWKjmtK+fwjqqKaP97CE6qm
         B46RiSW7XJUWJ/v+iitRthUq4Zr0nc5zUyTha5k4R0AzTZtmb/9JMNGvc1AYwFDsTECU
         M3Q+ZFXpieZkTty7CdCioMQRG7w8ERA+GynIn6fd6l1oMUBx8SMjroFSZ8qNHwaC1wBt
         4xvP+A7RpRi7FgL9UL0YMEHBWB/ctSGfUkNcWWk3vFsMDdWfoNjlsLvsEThK4BpzVSjk
         kjWA==
X-Forwarded-Encrypted: i=1; AHgh+RrB9jpfq2c6PVF0IlzO7UFJlVZtSGoct85L8fzxzs4KRQbSlS2phfxXGnIuJCa6ZdZS6tpt+RzAtwVfyg==@vger.kernel.org
X-Gm-Message-State: AFuF++mGfBW6TIMz/WuDm+zOCAFiIlqbB0pOEKGLj8eY75wEQ0ZQ5RDO
	FXKw1M2oDjqLTaLAGP1cwsmD34JvSRjpaNaMjmaTs6RlNItTez2GCdB2
X-Gm-Gg: AR+sD1050Z8JVT0py2UPJiQO2erIwdOsZq0e+4Xe2lgRwE+2vW37UMPv2qbjoSfn5za
	b/+2qZeq8/TzYsKzNkRL7CAuH10fUgI8lkRfbAnaJezdCxcmeeU0ayWb9jsxxeVGYowK/ZgOseu
	TNT1TmqTxNzYZiVpKcV0C1zkYct1OXuCTSSuNE857HpQcoliQV7XDxfDN7nXfS41z0TlHJI6/Fl
	KK1pKIlUPwcsRwJ/BqFpk8Y7nKRHlGVku5Jxi6Yh70K7eyjVN+vBQ/9u+/TU04H2Vv2gLwsLxLX
	O8N4AWlgpyE98MwtSHFt+da8lzsakRVHlaBciUzcLFqaMVyfimOQ58tmn1SqKDDMQV+eZBxZ8Gr
	KkbYEEYvIPOk+H1DD9+E2dmWFsTVpIOxWTLImoYHQgllKyLYJJNGcKYC7UQrA63OAf4m/pdMYWw
	Z5UmaX+PN6znCU3ku7CBlpGLd258h4lbvRFnK+Dhs+J7OC868yLPrCNdzl4SCW4ONyrDSz/9aEe
	FN10df32L/s3sPT
X-Received: by 2002:a05:6808:10d2:b0:495:f697:92d9 with SMTP id 5614622812f47-4b37c88e895mr9695964b6e.7.1787872912836;
        Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 2/6] ALSA: usb-audio: Add PM guards to US-16x08 transfers
Date: Thu, 27 Aug 2026 18:21:39 -0500
Message-ID: <20260827232143.149197-3-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TASCAM control helpers submit vendor requests without preventing
runtime suspend or disconnect. This affects mixer writes and the
volatile meter path.

Protect both send and receive helpers with snd_usb_lock. Acquire the PM
guard before chip->mutex in the receive path so autoresume cannot invert
the mutex order.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_us16x08.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index ebff185cbd2c..14fb1ad764a7 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -151,6 +151,9 @@ static const char *const route_names[] = {
 static int snd_us16x08_recv_urb(struct snd_usb_audio *chip,
 	unsigned char *buf, int size)
 {
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
 
 	guard(mutex)(&chip->mutex);
 	snd_usb_ctl_msg(chip->dev,
@@ -165,6 +168,10 @@ static int snd_us16x08_recv_urb(struct snd_usb_audio *chip,
  */
 static int snd_us16x08_send_urb(struct snd_usb_audio *chip, char *buf, int size)
 {
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	return snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
 			SND_US16X08_URB_REQUEST, SND_US16X08_URB_REQUESTTYPE,
 			0, 0, buf, size);
-- 
2.47.3

