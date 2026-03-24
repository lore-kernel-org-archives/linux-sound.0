Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC731E83F
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382388; cv=none; b=FqYCCNYtULYyGLPz3mO9Z81RqnCdmZ8kJii3n4wM2GLTP/OeABQUI3rlSAvFYTjMMSUnZNDCn1XDYfSH864SjBI6Vif0nKP9VSs/BK3371ZeUxjE2cDmngemZ1n075G5zpTJcBU1zQSRl15PFZgBxjhjY1ZXb01gdebJGUam8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382388; c=relaxed/simple;
	bh=z7ibkGNm1QW6sR22dPWU1jnwc+ukldoM5ju3j0FWFVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AuMeeCtjXGLXtMCKmFBlt+3I2JVLJRospoXVOoHpyv8SImNKhWi1pb7lzpb5O9LjPjI8Kb4Y8E5HtxsUWa5q9H2s0Q2C0Geq6Pj8YD+8uyJhxO1z1FlaHgUBUGlgMbJzAUdbxzFgYfhDEucayDvPAhb3H7NRBlfqmuMlzJeIZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou+slTsg; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou+slTsg"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so3735245eec.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774382386; x=1774987186; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ua2NTGKaorenmmg2d49ovrLt+QpXF9duRF0O4CKNrgs=;
        b=Ou+slTsgTm6gWd0IHjiE/6N3Yi2JMFWFJWgp3hbMiajsh9RSXNCnMHS6m+5abfp0+r
         C27pRUJw8dMF/PrjKDK9ZUiuLoyQaH6Eq6D6mWqpWcDquPT0h+J5IYhn6fpkWldY7ydh
         47KM2/uuoCZMmiLWW1lPRfh3N3nwNm739wpgzDJQLzVz+BqXhly0+fDlblGFHPyWOHEQ
         pV2l54rSRRgkisMPNV1Yu69QuTwLd18N/FtXkH8TcVPhlolOeRUR5A5iiNjimORYE76O
         K998E+Mt25CoYA902mIThodoqnd2Rtsw2yOKcmQ7tIgzHQqrW5W491tpMybImiOzxpkL
         scWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382386; x=1774987186;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua2NTGKaorenmmg2d49ovrLt+QpXF9duRF0O4CKNrgs=;
        b=YDZqQTmVjkwCjSNPFlMJFqrpDN1a9wy9Smb3VEEGUtmWrgDbiImgq/o60AcBS2oQyv
         mG9MtMsJForSP1JocsyKhEhy5BhSlEbzHomSU67UEbQFgJYelu8H4E66YlhLKCMjsQCZ
         AoS9kSi4yc4Q5c4SokIdhisJcWYbhvJm89Z+Tgk0/qtAEpaM4y95U9pdJU8nMeKTY1iS
         g7ddH299ZLaTZk0sFWvyiMU29ZwPA+Xxr5eNShyTbD8hkB4NwYEHY14GT2I6jvzirVxJ
         kyF/6ReliXYJpMlt5R/uqvMPtMYitodzCVoPzYXNIuEdE+ma6usAeGtaeSYi8ylAweEH
         1Sew==
X-Gm-Message-State: AOJu0YytSVU9vza3Bzh+wgpzg2yJAEy8LohVpeMh81M/Wb99iZbAouLG
	OoU80P99L0WiG15JrDltD9Kyd3mgulzunkH+dhluEsajGB02rO+xRUfY
X-Gm-Gg: ATEYQzyFSWYLVH6bWN8kZReWGhgEZLrXyI23B7MTxcJuLNM4bH8Ye3HVOOalZkRAZIo
	UG7a6whlml0Yk1ofvS0IHw90KUWE/0OHFybFqaPa5JVwIlFh3iBpHXfHPvRDoThNcPd2ghnGwB6
	gfHG7WU1T2cb+/7E6ajK+FlZKLNychahCaLyfOmNoz4Yh+c1xUTtYEoKTeV96haBHEyf0WnZSMW
	+AoBklyEbP2FyrYGxnlBR32VSMkmp+aoXhStTwZpxXHTq7cOSrbOqSOv/X6LCAmunBITM5HFUkS
	G4kpM/166cqhoXz+59ImxFdEmxJwbT/hxSIT+M+ZL10/Dgy0wnkBmiq+uPKuamnHFy+xjaOhUAB
	avnk/X2wu6lEWhUhMuI3JrSjKNFQQbp1wS4QD9FTXZp4swD29lsHMcENENxr1K8upYOQiP0KsoB
	+Hpfl9jJFRm8Fep+hT4BrQgFeLJwF4Xrn5EYgVV2oFahyCwd7rBadzutUJIbMw6ySBWJzewJdKk
	n8=
X-Received: by 2002:a05:7300:f191:b0:2bd:b102:a022 with SMTP id 5a478bee46e88-2c15d3c0932mr350819eec.27.1774382385936;
        Tue, 24 Mar 2026 12:59:45 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b1b8sm16718375eec.8.2026.03.24.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:59:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 24 Mar 2026 16:59:41 -0300
Subject: [PATCH] ALSA: seq_oss: return full count for successful
 SEQ_FULLSIZE writes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-alsa-seq-oss-fullsize-write-return-v1-1-66d448510538@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBG4auQWTtJKeiCqxgXVf7qJE3BGRAi4
 e40LL/NexsZVGDUVRspfmIy5IL6UtHrE/IbLH0xeedvrvEth2SBDV8ezDjOKZn8wYvKBFZMs2Z
 2fe1d84wR7ZVKaFREWc/J/bHvB2y6dDl0AAAA
X-Change-ID: 20260324-alsa-seq-oss-fullsize-write-return-0d1203bffe45
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=z7ibkGNm1QW6sR22dPWU1jnwc+ukldoM5ju3j0FWFVU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmH3uq3tWaktFdtXyD+wFk/3zqq50Sz4obAzOxTdiK/V
 cy43V50lLIwiHExyIopsqxOWmS5p+vB1fq4FR4wc1iZQIYwcHEKwESEdRj+yqckb6zPeGHj4xGQ
 sjr1R3CBXLt1scfCC/a1j/2Xav/6wchwTKti8z3Wlay8brXZzDeO5nV9VGqXqD/64JdJpeAHk7m
 MAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_seq_oss_write() currently returns the raw load_patch() callback
result for SEQ_FULLSIZE events.

That callback is documented as returning 0 on success and -errno on
failure, but snd_seq_oss_write() is the file write path and should
report the number of user bytes consumed on success. Some in-tree
backends also return backend-specific positive values, which can still
be shorter than the original write size.

Return the full byte count for successful SEQ_FULLSIZE writes.
Preserve negative errors and convert any nonnegative completion to the
original count.

Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/oss/seq_oss_rw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 8a142fd54a19..307ef98c44c7 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -101,9 +101,9 @@ snd_seq_oss_write(struct seq_oss_devinfo *dp, const char __user *buf, int count,
 				break;
 			}
 			fmt = (*(unsigned short *)rec.c) & 0xffff;
-			/* FIXME the return value isn't correct */
-			return snd_seq_oss_synth_load_patch(dp, rec.s.dev,
-							    fmt, buf, 0, count);
+			err = snd_seq_oss_synth_load_patch(dp, rec.s.dev,
+							   fmt, buf, 0, count);
+			return err < 0 ? err : count;
 		}
 		if (ev_is_long(&rec)) {
 			/* extended code */

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260324-alsa-seq-oss-fullsize-write-return-0d1203bffe45

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

