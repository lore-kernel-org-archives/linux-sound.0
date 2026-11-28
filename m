Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848762;
	b=M8f8fk/R8IvR2rK68LkvyedX4n8VkrhPnMv0FctGAudv2ZuQ6rOcVL5IGX8vO+L9/cZq
	 4+IOTfruUphT6XfAmZdAmCnO8xgZYa4F14KI6rBYdcLps4SfXHQgWIYJdag0U+uf3eKQi
	 8azbvAlrIJUXt+3x0I8Z3dORPtt5noa7oah2Q2sybQt14TVPNkJJBpnTw2C29KqK+nK77
	 gzo+7H8NalCz4vBl+LXjtG+y32c/w5fb+tHAJB6Sk1Psmhg84aGRLUiMmkpebMyCBOTBW
	 HXHue9xFo1UOVfzTpbGEr/8yidwM212z5N3D231dDgSxcBDImW3mTNsIrDYBdNuqNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
	b=nzmSVKPG/RQSksRZ15vJzo51GUlpKToGAmB+F35VJNsqh3fdsIJ/Y8MbydlqWOv4go5R
	 mAOKndXDx5IHNPBlUGIJK+wjUea2bD9oqmdKcDhoQ75kzM9LcP4dp14sRjVrrJli1IL9w
	 9UllntBkaOp2lcCEptQ5eUyoRnMhhz8Mzm5evBGx+Q5FjFVCY/nsub1yYHULRAjX8OpMs
	 gOi4g98Lf0GN+kDxVmm5AaHt7r22oEAbgzdqTjYveVPqPJUs7ZhJo8ysmLKJokqEPU4Oo
	 PqDllYWHkNWj6Q4FcRI6/YbIqwdllMlltf6P2uzc6x0krZQ0AcCtWoSEV3C6dgSD0nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB2606A335
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 06:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BB2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso3414777a12.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 22:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848761; x=1796453561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=SdZ1qEx2enr8skg9XEiVFJKrMzA/CoIp4Tdf8G7PXLIVHgrZ9gdtycHXK1ZdYFjHAS
         QcZjfmhedQgzEy30NJXxP/7+qUBajFXACz2S1fGK07dUp1c7gB16v25aiipi9vqvjzl/
         y9CVrMW9RIoYvKe/+qUX7CdeLuQk4caTY8Ok5+N8nB4Cf9+PlRzC8qmwwmtCEvjJla1D
         1OOQQgcz2dJ0koDQMJVtB2gvm8065Sj1F4LH+uXCd/aaM6GyvQ86zzDF5fFalCVg/5QJ
         I+574/mH5UFK8SGcy53w1PzCGJg7NOpkmG69EezcbFFkj4CJhc4NhjXpFkdpiwn7yvuD
         OWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848761; x=1796453561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=2iaU5d6a3kGDraW1rDVEjQaQoRjlBBjBuTBd/I1CYwTki3AMKdn4GNtmer2poqs6DT
         ImkZ5oMB+LURPTUce74GiiX0EYd8vgADNJ6Zwsxn46Mk1XkzTldztVnQ6UIf9cAr9gRn
         Bl9Xi9nSlC8tnFLdNqeYPK9o8qpvwfYGYCCgM/ly5YCjJ5zLsj/zbyQ6Uts7FKkCPbH4
         EJE7xe+pM+tzz6pxTyo//1ujub84q47cB6NBXNz1rgPjsMjeLdOESFBTw5KoMaBxglSC
         by77SGpCEKZqvjjxMEyfjdjrXTKIv31Ls3oGf3toeg5rMZ3dRcPdIDiXCiJmyJk7v1cR
         yjzA==
X-Forwarded-Encrypted: i=1; AL+hErHbaui4inZL2Nb4zFTRrha5CQDbtVJxlTyQ8Fg4ax9DWY4EhbqOLoKgqqmOeH6yM9CE0gED+X2d+Js2hg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+i/YOqalrNDo79Zp3EPRLyeMq1N6v7/MK3LiIJMpiEK8GjC6ox
	0M/OnW3FrHF8VM7tNoLyuqGScmH/RrWy2Dhxg1uETnb2nigB489vhGgu
X-Gm-Gg: AZFdTZda/g5tfJMgeof6ciVUY/JTlK9OBjXuUJEyjgOYTUeKq/4GUtAd7TUhgezDPbu
	GhsbVLnGenKbRmjYiDRUrG9l2eSdNGR+698ZRYmUhizIiZ47LTyKe/KJDD17fb9HOyogmjbVa5a
	g0y2veUMzMQrP6TBh6zHdsMW2n3uAzvLVyDqMz8mlJSYQvSBGCeguSsLfHzDCXKQxra1IzYEEdN
	OrzDjAJzNL5KNYAn8z9G7q3A7cnQCNYh3o4SVDTA1LDnCeJU0ztfOviGWPLiDCMOxdzLJYj8Xui
	a3ab7d5dxUAep/U3UHDqpY9UUR7JfAVUWrCmfVdlpfMjUSO2FMRBetmq8vDufz29oomWBhesoa3
	dqNE/RH+8kbi2/iX2ppnIHGiiXJNbeDYZewKZNu2/U33jzbLBp6zUIADpI3+bK8Pp7Sx/zmmPuf
	MH41P1E9QTjtMiwI2+lsACVzNGifRwPHhQTNiJIr2lAhbjLyis0lGysj37Lle9rCXi8msxhmM5l
	n+cqFXm4N05lvgtqQetCaYC1adjEwnvsCcR45vNpBw7Yl9uxF8RUa2cj1W4O8+6K8xnvvO228vS
	UKtLP1S1cleOsGTWE/qTU/70cwN8AXgqjxR5FzQ8Ae5i+Mmkvkj+g6vPVFbDcc6INu0IO5lINjV
	Q4DV1a2rT+foioF2evb7FrOK7GFOr3ZKjRQgiizj7
X-Received: by 2002:a17:90b:1b0e:b0:3b5:3606:f7a with SMTP id 98e67ed59e1d1-3b536060fa4mr5474722a91.1.1795848760623;
        Fri, 27 Nov 2026 22:52:40 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:39 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] selftests/alsa: Add a config file for the test-only options
Date: Sat, 28 Nov 2026 15:52:26 +0900
Message-ID: <20261128065228.3628550-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP
and CONFIG_SND_UTIMER are off, and every test-pcmtest-driver case skips.

Add a config file with only these options. pcmtest and aloop are under
CONFIG_SND_DRIVERS, so enable that too in case the base config turns it
off. mixer-test and pcm-test check whatever sound drivers a system has,
so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..23ea0ccfdfa6
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,7 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_DRIVERS=y
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0

