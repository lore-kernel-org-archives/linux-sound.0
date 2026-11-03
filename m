Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664291;
	b=c3fwsH62qU6YWkzFDY7iVk6GsHJw2w0KYIeUSzfBVCViy2d8zQJTIUpeQNCnDd7BuEff
	 w6ZBN0Ce7U8Vb1ovUmhh8WWMDsD2ybT9wG2GVV794yAHLrkL2c2c+90L3o2N+GaXzl0yG
	 +YwIeamphNqfnatsd2QpSOgw6qKSPlTjYCYxEysEkB2NS/9FwRNM37yNZVBGPCZh0RKd5
	 o9cr37A9Y6D1VOkCJs/xVcuh5txuB9cHfj3uRkRMol/pUZ6llhlOy4R3ccLaETQN5iTWj
	 dxwhpOlvLwXEO5NdbQxU0itfHgHIbU+FwzgFrVQOpWyGEjFP2wpmyQbBTf8ZUHqdgZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=EiBJeqYNhup9iXvhY7nimLoZCg8LmW2tjqZoYldFZZZdsEopJx3ZygiCa6L2+hwUOytM
	 aJq/p7xxNtB0I0uHUBS97g7LwAaMVASnQaRqyYDzmtGKcg/a7EsnSTn7PWppUmVwwMC+z
	 VB7O9lGIFIp2NfqVqAfo9hUlKK6zvHvKoUTid5hIlzTnM4ed/Y1FQdzhOId1V0JHQCgam
	 H11wE/b4kV8ezWt6QyPo25Dnbnn/eZTRvBNixr1uQwgongsNwYCwckfll5Ij7ctb5RzL2
	 r7alvquyxeWZGIo51xdhVdKm8d+/NRmYKu17EdeuBlSkPItm+rohf0akLVs+uDl6Jlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6C8606D81F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6C8606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e812e2b31bso21343795ad.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664290; x=1794269090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=mrnDsFY+eebB89xZ+DTIafFd39MdDkOLEYtamDNq83jCQfH7RMjlPLE2anoUohaLr8
         oTwh53Zbi5SzKKY+nR+3fBGfl1xBauWGkT3Kq2E2hg35H2tnRevGfJYnjygVezf5M/nu
         BaU8nkfqxQgYA6GiVXCBgeLyM0FHPbiKy1eweNxWcznMkFRk7ob9zF3wfDDLdS8zhKKt
         dj0KBRSRbTctb+hkNWansuprjxYlK7kBAefQQJtmiWTn1vTQ9ebxi+RxUAlfVAkLRYLe
         gir6pb43XjiYHjPMrveNT6qMsojM2Gn+2PcZ0ctGQJeEveTSJ5KIDqOuw7+92rJLUFKk
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664290; x=1794269090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=sH9Gg7mdn6c1yqNVjuojJy6kQhsfgVHCR5TCVi2exF3LPzQE0PT9matzD+kKjOnI3e
         ZcyQ+g9fn5az8C7YyhyfK6YcJb5J2rIIuFJOXptzElCyAZfrYgw1Z3mq+4pJ8wHeY3Kd
         cip1mowbweIgZuHXBzmq5JdxP+MVMuVhC2K2sLi/qa6XcZRT/xZ64KeY4ZKDW3t9YwKx
         yf+yMSrIRmRCzgFc9R3ixuoe8qkcha7T1lD/zw4nAMSFQtYb6woJernNZNRh9ypEI0xF
         PT3j4Z0x/XiXRl6vEr/16A2dmeqqG5t0X7CpDIrupD+LF0QmAqF0C3K8kTXKBPSXGSIZ
         lRTA==
X-Gm-Message-State: APuU4Z+upWLafEMZx59CEBnImpEivQLAPAl/199DDIQ0nglVTpkM3m+F
	sid2b388Bf6bVl9h2C9dR1U1md1yumvWNYbeuexjAdzc4c8CNdZYdrhX9yCgMg==
X-Gm-Gg: AYBFou12vFcp84x4xcYnzb4v0A27GxwgFrXEvTRbf1wp1TcMlqrnThsZ0z+tc3I7Jma
	3dtD7snpMFGczG84Ur1F1FsP6qvTzXwtkbPUXQGVK42KEsFr8WIZUPqpuSfdJb241FhOIEVww9g
	NWBnJDoJJ9dQURJkuNP0FKTVHLygE6rzLIRn+f6Yx+ha3ArD35/aCmoxFwbfmMBcO8YHta2mXXO
	fi/jxz1CU+1JRXLCbXPaxorVuSCKzLsolMC0uXRyoapI44JWGyaCk1Uj6WWJwhLpDVpLjPiri4C
	A0WtU+AJpRDzv/4TL420PQ2hqkZW/az2l1FS2AFN89Omf3ujOYmy1NRKIL3629GH+G0s4yToHan
	vG+cQCbS06AJmPYhZcwo0IPigcdYGy+u+cZfQwt7Gh4A4HSuUhJM0os9i7vB7Yem3ICTdAYjwZ7
	kx2TxGEm0BaJQhJBgscinL3n62pnNBGfo4ZAMLYyCjqDPCp0+lGO2nuih7ZPO5SRFKmoFAq2lax
	s9ur4hplEXGGadfwEouTBQ8yspvMshhNZPHjshUC1KStFg8FJa4E+zuXdEriiZAwU6tKybFao/C
	gV/qHvDMkd944OL096FTQjza1ek9KfdL3l8lqXYLXfMGwBskDvNvLiaPCnoF2QTbwHVjm7cbN73
	w64sBkt5xbxjgIn30JyWfb1L4ZNKl7zHX1iqZGxy0F/q1ZMA=
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr9974105a91.11.1793664289956;
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
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
Subject: [PATCH v12 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 09:04:03 +0900
Message-ID: <20261103000403.67106-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
 
