Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062111;
	b=BNbErZFDfBdNmM7UoiARlGn2SMimkZNcEfrNkNW0wf7tLHhRrlwrscynyvlMbcQ763AO
	 Gmeet11ojPdvbFzwhCLPVHAcpSraSsN5GUatX6RRJUf6rSVlIjy4wZdf8K/bNsEZ8xmpF
	 gzrRg59iZjRwEOOhEXTC1RzF60O1yFTXLmoGRutMvMp9NR+aC43jYAfHTSBJnVL4Gp+E5
	 p8fRRwSgTuQL2dt5z235fsYCJ5231VWzlY/Rxum48QUOCZiewbFnuqyGrEhIfymVNt+N9
	 /pNh5tDpMKaNzAyWKcnZn7BGECuU9tu5AD4TWsg5ak3D82Uk3Kn1mECbkNsRjAkOqoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=BDkKSOoBPpH0sPwe0pZgB8QdFiTUnGizCxx5x8JNQOXTvGZakVuJzKscAZHvhoXxp3RM
	 HFTFc488036dQA5wadmvZZigUzDE66W/WXp33VZKJobKAYmobRyZtn/mY6JupeOUO9OCC
	 O9HG7DfOznMdjh7DFVWHLRb/+hycwp6K8o+9YFpo9CNXy8kvaaaAWKFFVBqegzCD+GGr9
	 WFSqzr8cPP4cSRRQEMla1DhoQo3nEgNVJ2Pb29VHPumj5lH5Pjpshk4ysjubLGM2rrBLc
	 VuIT7EKbxk8DtLB/cWTCSdVvyJLVQ1qJ/P6zC42Qxz1THRFYO+zKevROoUFC6gp1BXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB4F60A382A
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB4F60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2578594eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062110; x=1794666910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=o+zWiibxlcf1e4Q3HKHmJB6FagtkHkcBWFoJcsvBox0/HYRtbyrR0rs0+PcKHa8RKY
         WkYD0B/eLRXTN2mrXft26PujZ/4+8zklSHs3wxdtYaaiwExmFb2RW5qkNWkEeSsAfSvt
         DISr34BEEG1jadyInKQQFzbTUOzT5/1V51+Ib8+EAll4z/7Qomu4RD6HSXV8kvd5sro9
         PMKfsP/P28cF0zCWziu835NaIH/WnJlII/2Fl3ZABlgUPLAE9GhbeY7Xle/dpli9mq1F
         utn2aHBDM6XT/BGvXmJW8Npx0pH91eYeSc3AwgPQeymRSMVyxtQiz/+WmOWWRSYoCzqr
         hzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062110; x=1794666910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=PyopJ1Zq+yYBxyDyDwASAzCRmZsNFP8I4Fo8tajD2w/fy6o/7i9DAZeLw14lO4xAU+
         Xjzto9NHaUAl4aul4fwyrlT5rsyCqKO116+rCTJJ+/IBqEEdQ3qRDiXU27+R9wDEVUuO
         Vv2ca3SBuO+3VsomT12QL7pYhnjXk9iljAy4lG0oZnzd0yHOYJUpUawz1cqWP639hvwa
         mvG+W0mRrUp+8SrZ0OVgaapiYdge+kfAjyVEcowkC6erU9xy8SqaovKzzga7ygK1qE3o
         AX2AA4zKPj0ksFN4QPjoBxQfxvC86m3q2M4HK4Fuh4czvyO0FuXW86ORw+PPbX3zOu1r
         yKZw==
X-Gm-Message-State: APuU4Z92ISfsfqaUkUkMR+rH8pJIY4wcH9DgzA+e4uWnNq70Ifd/wrab
	H5yrnaJL2jsGcnHJHXbYw6cCadVfiDBq8CborYQMnCneVH3B7KoJPrw9c7HKxuvB
X-Gm-Gg: AYBFou25ldn7ZvYRgRa+T+ttvOQ7udWknKoteOZ2q7V+R0XMTITv3Oig2GtyIiJNjcH
	VvVDxuUM0O4O1wAK8St4NLeKMxNzv8+fIO22m0iYlH73YZgL9hEaEZrdPexmyobeN3LEc5vf9LG
	+sWwOduuhxoPml16LKV3F8geXLZd6HbdubFz5C20jEG0F5zwrOk7LWKi2uCL7Gpw49oHQFgLYTf
	gAmuUxWGkkcVtqIc9C4x+gYn5iQOZWt91fYB71KXJYx3jCADcnQuN2ZUWEIORbJO/MnlYxvBG21
	W2XJnnARD5j1O79tN3q4UqH9ZauKLOIvjg4WrargLqj3MYxfH0RhFeY/MtSNDxjNAo7edvVw70c
	luIY7bsV8gArfZrn/V2j+UovWcry/03PgS+N734SyhbDwxws2ugJRZ9xq6Hz5080lvd6ORm4pUs
	5bbbi2EkB/ZWY/q52yYq1MzbelWqsKY/BqHtnhOMg8OvVAMvr79Q++IpqLajD8ScU46/eUSdref
	bdJlEYiwVcxNzSnXrGa0Im3wEeAIf9k2xrCJCxrYYWanmhN7qaDGZgfeEENOsQNY8iQyRFBVKpJ
	AucKREql1fsXxcYv/dQ7jgd/FT2GzWgd1tWL6yLtizQRK7MlPBZJwiTlDwmq/We3TQeN3+TFBQN
	gQyc47DAwpVE1PM1C3ZwKb2XzoH+oJ0rVFrHdmz7r/tWFzA==
X-Received: by 2002:a05:693c:6213:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-36f77ce5f6dmr8295810eec.31.1794062109556;
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v20 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 23:34:22 +0900
Message-ID: <20261107143422.29319-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
