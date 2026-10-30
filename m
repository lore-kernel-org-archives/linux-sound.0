Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338034;
	b=Cgzj6xPkgsvqUlNO9uxgWDYnvjwOKmp2MpRZtylZP115GQVWh3NZmnOu9ndYARQPF50o
	 fEPmS+madGTlqrJTNSpjW+Co8LRb8HqiuKrYSHTSu5x0InXsHt3T8BAHBaqtly0rcFA78
	 ut52PeNRGAXOzP+Rdgrr6J5fxUT4NYTBZUVdeusUW79VqoPkHJwvmJe/vSmJOWx8Qe460
	 gRjYx3RzcYMZtfkfD+X/8OjobOTMliJFlilbNBqa7gdCICZlmmWNCRrKWM5XIDGCaNiGc
	 emye6/3sNzNB7s1hj64oHW3qF/WafX12TvXq+nS/5p56D7F0qHS82djvKXkB62FUajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=zDxGngUIyT/n7AfPgusW/tAMknvT8+f75pnmM35KahDeq4aEYg+//BQMoH+vL0jbGEAJ
	 vBVjFtQIwyd1r0EDHgy3KksUOQO+1zhEsQcbe5BP5iqFzKdUNhJaxR8fDjzjoit4ponxq
	 hEaZmO4Gf51Roiel2qTyNLBwMTevIAz8bG6tIgY7zkeR9cYre7p0vz9qkBp+3RGe+y/Ux
	 xOFDLKi1rf5LFhcoqD/aeSqjRvg7XyDUyjsmgVlgsPO5mQv2CcV7TJ1fYO/dAbg0b3RRF
	 6bvD+9AfeWg/RQw5kfaLsnWRmKVsisPRVmGSioDdvtvXjlgwDRa5QapkbkMsDCTVyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0A606A329
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF0A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso172606a91.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338033; x=1793942833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=ZGotmsAWKG1IRKJ7iry05CPnTDzh6s6EUXB/V9yWJESULpVmt0jHwIcAq8WV02hP0I
         Hf4WXTmx3/bs7MF/dH1KIaQVDcIE2CdZtvN+PiBhcWSTAIpCxl6RZpHQRTExoQ8qrWJC
         caIqPx8cHNZwxfjGk+XrpoNQfXEQA/wfiWhMezPcnbhsD/Lq2/s2akb88zmZKo3IywlA
         IxILp0CQY/hF6hUWFw0YlRWD+24vofJZ+wXU3FQz0wZENjrVSFt/XaWFK+CclJxR2PwA
         7D/KNMc4MzniRSzIy7SARifJGxQuSR3apsy3uAlIljZYHA5BL3UE18Xy33ppaCHAE0Zq
         gQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338033; x=1793942833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=RVdssgstmtoxGkAEi8xUOT48c+TNfWtjaG/XTg7WeOwPpFJA1XQTxRrtM6v0pf2yip
         hZOtSVykZe3d3GSE5u/wV+57HqFx0WgN6IqsgDe0TphOWJWzXJ8oxmXfTkQfvDO8+jIG
         7zgGZ7w9AUiQbvIuUSc84ZtA8OE0jehEWx/hNjLuBSFloEtAttRTn0dr9kKgmMEIFqQ9
         HsT+BdyEPoVzhCCzM+tkWv3sqi0IoXDiMsMJ+Yri31gQohB3pwNqX/rxQmEI401KROvK
         uUGs/+YelG/UMTMrbXLtczRPZm0Pc52++AmcmV5WTcFX5LGTc+wH1EMk9l7oX1ACIfsh
         jcIA==
X-Gm-Message-State: AFq9FYKCVELPadM0VF3coMJLsfk/PZVHKqnnQTv1D5vShBaU/kHmS+rB
	sSqGEN9Oj3P4LO5+bxNo79fPRu0MNz3agMd+ezVjTrb6TxiSCeuYEq6wDMNj2w==
X-Gm-Gg: AYBFou2U1qy0m+ufp+0an+c/l6OMSu0gGIUso2eX30qPsOHfINlsG7Tn5Cnqfq5GmVh
	IncGaMYU+TSTLF0et/Y7ekrwBG4jcSgYyZ48b18YE1I5ONLfvb+5j5XbdPN2xElSwGYRpOKM2Bx
	Gd0X7S/PS19330N24rtcqL1b5jLcPS4JSIhwd76LGS92zNVQxxzLr4FhKNEROT8Ei+MYUf3XT+v
	MkUJKnlrc5YsRxcupipOb79PzDBWddcMz4Bd7hTApB61JJGU5/yLI0E1AJFhOJx0ZSjHMUYfLAJ
	jsU3V6wUSl6/nCkAXWyomSGqECqA/bYSduL+rK45r+djskXwXPzGETxM5Ct0tMWofLxQDhOT3A1
	CSdlVegNX9UUm4IaUt9klWR6NXfSK5ke1UXbcM5FaSQlpPChJ0sUaSvD2H5ueDmOXjE/Xlcj65t
	VidaBl4R2IyGQbL/2BYX7zT8OQ6mujb2Ihe1cHbfu0KVnrUU05B1EH5ACzihyK0KP4hUlyUIo81
	WUHaz5TAyug29O+jfSu8aa1xw9bgnyRMkBdDEpwkD0N6PuEM6TPO91Z6wnkAhMMbGQ81hAoTrUi
	V51P9WK8yRnWJZSSNKuGN1b7rtUEihKFXO9VP17rfyFvzlAZdeM4hb9kO25WN2wKXFuI4BSn57A
	R058PNXamFrIpJxGHWCCNnF9K0l8W6Ti9tzryZydHYl5HqHc=
X-Received: by 2002:a17:90b:3b4f:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ae8957a24dmr981624a91.6.1793338032263;
        Thu, 29 Oct 2026 22:27:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:11 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v10 11/14] docs: describe virtio-sound capture options
Date: Fri, 30 Oct 2026 14:26:26 +0900
Message-ID: <20261030052629.27742-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
