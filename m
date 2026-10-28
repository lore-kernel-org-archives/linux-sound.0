Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156049;
	b=mgIDQmsZsGuit338kv6D+Fg8DHaY8h6xqLnPYdlIFQS3Eg257T0I0fyWPZ4xeRtTvLgn
	 yeaCs13OCp9JcX4uWWm7QL4lp3nSyCZX/1AIpJCYbCVGUCctJjD9og/7/iXBLIzQCNPnG
	 pbh/G+u80hcGTn9sGHsMnWWuTRyrEk/VxnSwlbdWJtuad38cp5f/IkIj0Pj2X+0L8OM6z
	 TLoqqElNj+JtHfBHyLCsLxuYR1+5DiF3wrB1KMrCDbJ9ee7MI6dViBEFNR1UWUSJFRm1l
	 oYiq0jK/WH/eUO8rSd/Joxi049tA82/uyB7zbp4odw5LUtDBjsgZ2Uf3igv4VUPkUTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=XyJpYe95JiBqjBsyx6pr0vI7oscpx05HFosZmqB9tG41k7RqeFLm+Mv2OeCPZ3QEoUIP
	 05wIf+KpjUZWtoAyLd/sMbxI03FFZevXx20a9dO+a9fdMg/8NX/vSz3jqjG1XIKXwhkfS
	 WjU39HS/EnJHJsiACpCAK+jSUA2+MOuJuFJD5Y4STOImLEk/+qmc8CedenKW+TXA/CM3L
	 3GUZkqUFXNF2fRJ8Rne0WJ3JoM+8nJFR5x6nV9+4gNcQWmQbSxAUsdj1xcsPIv2U4ddLw
	 RuIDGOl0yUEW2sQK0zKw1z/39TDDlWSlJfepsjhSzpC+J0RJphAaJwRXRnyepr3P/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EA606A33F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063EA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f3e9e431so340512eec.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156048; x=1793760848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=EXU+7KlBRIpfDDOw1WHSD9pod1pcNY8v8oQ3DwZu4RDU/cfGOfygSB7DJA8PtZ552P
         4clI2LJqMx4qgDyCt6d9crIvGHG0aobY3ja9FTQmJX7ttf6OVxbfbGr8CDv90v/b0pkK
         2rIDDI98sqIt1J0XAitQgE0wWpjfYZJniJ4lNdXjRBca/tG8+NA1U2sKE2rKyb159Zq6
         N2GvZmfUwhAJmHdhFNVqXciqik6uG4l4hh/dCbId1wBGjcBH7JQJGrjBANtwdSFXxQJq
         TU9LydvTDopzo9kGXcbn82dI/t+Nk1tbb1UbkN0b3YCE1PxPSeffR4QYDgkAOQZjhPCX
         ohmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156048; x=1793760848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=xDQZ0P+Dywuxhde+PuhVcvp5OKKSVbBiv7odA6JkRcnG/vGENw+R7IrVGZQJM0nRgL
         +Qa5ujmwba4cDsuyP4incs22tWktcg2RW+9vG7UcVr/tLWNQDvBS9pFLDuWUw4FAJAel
         N1bHFSah8nBK+6T33zdvidO+PVFchanDxwX9Y8NdPmzT2g/Wy0qYEQOR+hF0r5xz0m8K
         3/k5AnU2DoDXj26qknM8LBGvsB6UcM4oTwpyXNVlmmlUB7csb+Ec25ydAnAyKMzYzpo8
         Xm+9rgHyMkwfLrgQvUv4cDJvaQ/VryOrrrI+N0m0D4h7Qh3Hw0xlZzY7G8TGccjh4Fry
         jCLw==
X-Gm-Message-State: AFq9FYJjCNINdGNOsjHjGQtKAUGOi35w8WmfnTY7OMh4w7QqtgM0uTRc
	7vmAUA8yhij4F8Cm8VLif20LImeC59GN4iEIRD0JTUFoshONLxsGLj4G9SGBRA==
X-Gm-Gg: AYBFou3drYZXA6suDBJYA4r4EhYNPKt3Qz6vHKyiLyjuSqU8bEJhMIcRbf0C5C1/o53
	c00aCunt6SYm/ceDwHVzXFSg5ypNtCcOmjoHjaiLA1EQUaE5d8aIngTvlK0/PeB0zAQIQ2VxC8z
	88DSIOsOHY9L8+/UVVfExqy+rRyEE8P/xAWMDCra6UOPGewBo7mYvciMwwMfYDJG3j4t/HzC2dv
	Uhh9zSZIBEDiFh4Il7lMhA1GnhiwsEd56GfW9PMVdnpCCV9to/uHwmopMDzVSBo+FoUChQnQAZo
	ig5WHoMd/6uU3boxHjag+hkKwDf6zrMILLcxL8KPugj322ytDYMjQmHY6IxCt4BnmkHAMnYPakn
	fPKynSOlmoyvPY/FqIUowyM66QOczarXKI2M4YYoNLi4QK9sJVE73+kwOjeyVwvMtQHkOVF3JUw
	qefrL72mrRlpgWMr4eNOu1pjfhXrfnVvhsYG1voBLwdXVlMoPmlOiN+Uks0XAya3YQokMT3BaXe
	mbvhuAnNsYn8/WT84gv7+SGOCgJ7SLQChGgY8vIsGh/nDGk8LxLtB5v3Z32AxSW0taTU15SeJIE
	F4OUA7KlrLUg+iK6jTP+Hn7GbNsOrrW1tsjkJWHWAmWOQnlAphpb6BZcSw7o1iPxxgaivMBCLxn
	Jxh+znmPkmeyjhRSulbDPzOZHGwOvMJ84s+w1hva3BxxvGjk=
X-Received: by 2002:a05:7300:681b:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-36a24739b3dmr365410eec.23.1793156048042;
        Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.54.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:54:07 -0700 (PDT)
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
Subject: [PATCH v6 14/14] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 11:53:17 +0900
Message-ID: <20261028025317.92450-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
 Documentation/admin-guide/kernel-parameters.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
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
 
