Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412575;
	b=ctQHELW3tLxsd2gcrNgHdBVNK3GLesQYWIqRQADmmIBiASA8YGB23Mb7VRrsw4oNECSP
	 3eCrOSsIOkxAPKa+CCZJlKOFE4xUDnPpJbjO//ueaLtiig4KqLs0V4X+2dSHZiuVeiTbC
	 seUDDNFTXLXrV+CKQjSoGA7MQmRrpUdqkgPI54lJ9S4zZhk/ukKxhozBLWkq9PcVYkvVh
	 J5ZBAkGBEEyohUqAzioZ3k3Z0mvzLNXACf26GdNs2IFNDFD7BbuajoabRWO7AcCi15Yw+
	 is51k45Q0ClInL4Sdv0Z+urFMjiGJedv5hfgMnttHkp+voUX7Syj4pIF3lsvszzb7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=khFvIMOM6UwrivlmeL1/1h2l8VO7y/T2+RlQRFlOZuGws9N0yn2y/P8MF5owmJST+1p2
	 vC38Vz4ukZWlUjzzQH0cgdipzUmWOjvEJ7tuSqRbsPPfnw/WXGQwkQAu1gQU0zNxzwU3/
	 Phj+oHknOPB0/s0EhmpXUmOgeBE13ODdchB/HLdssbU6v8yU1zZx69Fw/zZqtNxu2v8G3
	 S9o2LRcS6blhapcynBr+G7vCm98ZGNzK0cUQaO7VQo716hLwz4Aca5BBdZZr1HCB7k6W5
	 O5JkHk/0ze9BScYlEDM7fui7JQTuqL8L9DJK7eGAVbeP/wPz6dS4EbLS/swsZ9yQAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7816B606A321
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7816B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso1920050eec.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412575; x=1794017375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=G7iGQ4IFc/BWafL3mBp3RPPxJEEHQHFCjY4ARkrpUYgPScVdaAbwb9cs5+DjTPpaYF
         aO56AGg+1BC9a6/ToJkomyQpBRFK97VV1vCuVcgz3v5JKjLNZ36hG5OR3OVAN1CrERjQ
         1q4icAHukc8xInzbMhD2WqBOuayu0DlHMUHrNMspioz5DG1Jru4IxstJTCg9NsdNvboV
         5+xgFPjE5WfxEZBa0odoCt6Gqsc/NuPAV2KIL1UyS3N56R78ONNjfUfhONxMYqo1N9pY
         VqD9AS3UusvS17N1hCMpQo24l49ycpKw+E5v0MGqwaeiu2aIfC/H+Ek/LeP7ZgVsHnFo
         6Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412575; x=1794017375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=rJswgh2vCjO9F9i7Egf4T0Jr1+tR40u2x5uKtkYzVidasfu72McHjuroxAwDYQpsF+
         59ZSQ6Oc5Ul2LqeMLPGX7nM/aCNf5FKGdo0VAYLe9sr/nyraiIK5LBQpoXG4kLCBrggu
         huZvq2kYCDxhrobZj7pbHUiP1Lh7R3+ByVp7xrRnoksA4LtCzMjCmvpH5sH/wlH6TG8T
         GhymWl8hWU3+0a67btIQjymY+qZ2Kaj422mNhjCHVItcmxMMtG3kpucl8reB+6D8/uAy
         9RMzt/tWoF/3oxwRcDNR94Dcsg1kVJ50NXQ4fT0wBfEK9EJxw2Vi73gk3tjvsst4Cr5i
         ATew==
X-Gm-Message-State: AFq9FYIJDDKRFxtSlAJ4C8wC+EtgSf1r3lwTrxDDWNElQF6sxMwSWHMn
	qVotC1jCK9i2b5F3b466AzdtCOuQ/OOoc2L6TRtOM449TpetXHfwMDf8lqYuGBup
X-Gm-Gg: AYBFou2JpHBPYxGRc9DgwGDwlvbigjUkUSuCLH456I7g2MUYeZZvYVKUH3JsISEBc83
	5uVQp+cUQSTTO85d+IeKgriWSxPM0UCLAVscgg8wjqkcFtSUjZpvuThrADk7+WzSG8G9w7K3GQq
	IscB0B9+m/8kUYsMHlTOZrnVSY0npOSpGsHJdtmNPVWCrjJjItBT6sbvcudnW9CDj2pkbzNCHv6
	B4bQ+xgC0aI73EvsXc5zmSWvMRTKgV1h17LnUt71DebZ20kk8v/5EVWWq+nRFzZxiEo0llgLTH1
	9x6SAj3EOH1p4a6HaWjh5IMVsrfaFoYobV/7dlnYLi+b6lBqWKLqlUcHY+sz/TWAcUDw/2AGO4v
	pPcJrRbStYpKNkODOZwqeqiiBXDvvstUWcRNI5edHKfRSDCbtQLBaxhKjAceTHoSqSfQHUPQu25
	5pI5cRu+pdOxq1ESmHDYNfIBJ4ZE1zcnukPOlrvT7tmjwxEEit2cHdEM+p3EijlB4VdI2C7aI17
	HkCVgI6zqL9qmvr856bVhuentrUx40DhAtBk/sw3ikfTCfAxxQdF0ri44jfs8pvT9cat7Qpf5O9
	6Zqk2Aq4t9NDNmvUjCiUijlZEAgVu4dFg7ddpfqJvMgKtHJfsSjnyIIoteZ7TWDJoIdR147XYLD
	apI+rF5JRUAJy+kZoB+NUFmEniucUis1NLZ/FtZu9Eg0W4w==
X-Received: by 2002:a05:7301:b01:b0:36a:20b8:ee9f with SMTP id 5a478bee46e88-36a42203f98mr5112880eec.1.1793412574561;
        Fri, 30 Oct 2026 19:09:34 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:33 -0700 (PDT)
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
Subject: [PATCH v11 11/14] docs: describe virtio-sound capture options
Date: Sat, 31 Oct 2026 11:08:52 +0900
Message-ID: <20261031020855.2402-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
 
