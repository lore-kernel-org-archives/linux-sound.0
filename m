Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460736;
	b=fCiLHlmET1+WT/hyeGWdd0v41aezUargs4B2EaTkLmDATqypGuMCuHA6iwFwwhdCRmSk
	 K3XgDO6X7JnC7HhBR22Oy58Af9+WncavRF42aGJmSy+QatrgrXSTdYlGsoSpjuOq9V8eG
	 AlbRSG9kNGIe53A+7XvuARg+80rKR6GfS3urDrQ8cfFCfpy1+5rr+Q7v3qpihwqMqj4u2
	 5hU4f6cAnfAo+SrQaSDMKzY/LP8+ZyeWyQVgV/uJriW/DDXmfLc7HOa/A6zK83K5P88Kl
	 KVMDDJdOgVmYjrL6k5nhr2I6b2ga0OG0DzI3yBjmRyc68zbi/NfyXPd1RPBR/fev1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Reply-To:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
	b=3hyaAMY4J1nblmj/sduioRhG6yItiWzG77/D7IPtGkOtIRr8z2r3Fp+MHtpcvcCiR4jI
	 B5ik0TJJGfg9YWLAWUVmjXFbOug5gK8kq+RjxTkiiNH/dB1w4cJfaglv7JqCDL9qbpOQ7
	 +PriAv/MiXI4SA4C6CnY5nxrQTvd2dmjr7ITfhDQW+cdkdYf3jJZwmE9pusumkEBq5g8N
	 8RxnGJw6dCq/GHNZk3nOUj5/qTntDZz2Ig+4V5O7MD5oEWL7MfRuIvmNOkM2/9s4ZSpta
	 mxKVNHl+uWTRk/rp6v5SuZBCyMYe7UDAYd12Kp/5KyboTbrznOjv2wexyqew4G7+msg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deeply.co.kr;
	spf=pass smtp.mailfrom=deeply.co.kr;
	dkim=pass header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="c0u/NX8S";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47B606A332
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A47B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c0u/NX8S
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8225637eec.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deeply-co-kr.20260707.gappssmtp.com; s=20260707; t=1794460734; x=1795065534; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=c0u/NX8SiRs8e1+N3Ad4VnS3ir7oMnQ2hHdX/cFoPNmEt79EEYN2ctR4xlJPe3O/qu
         SVxqaVrxSKxOq2Dm4GmGG0hKbcri8SzGDmN1TMiPTFjFimgPeJ34b578EXgSWxIMLUKQ
         GT6yLwCEkOJvg1D2rWyGuUYO8fhvPSUwQYGVlKDdYqJUyoXk0t4xhxeh383vW21dEDtZ
         DBaSYlbMrJ9S7miRkyBelEynVNR90OjXXKEw8jwOmB35Z+ctVC0AUBU7VEvUTg17AbLn
         1NhUy54sDw9QbrEjm9o1AuYSbEYN+wniDcZqDfcyEvRM28qcMT9xpnLgZlgweV/g4Tlr
         md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460734; x=1795065534;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=b7kIsIyA49coYdPKiKEFitPAXHog96ZWPDbJrCD8YWrt2KonlgvbnX1azni40ujbrX
         aVDj6FwwbmtK2xQkQUpLcX0Zi3xX1rlbfNWVILYwLaMKnRM+1v1j6ep3n9mGITlwM3d9
         a4bC5uAPtr8JtXcH7mibwDq5lp6TRlaymvpolaWmjWQNsx21wNUBn1vndGDpzaN6i0j9
         IqsyQ4+cjXfMxQhv/tetx8tIuzEhrDNIe2G77tQM+0cyE6wSfgEoi2bWiYtmGVpGKOTy
         dDXazMeUs3TijDiR/KS+dF0Z8zJ1rG55aW+lzIFNykmW+hzkbPUKjXfeelcZyawyroA6
         m4Og==
X-Gm-Message-State: APuU4Z+DzZ7HJlSyQKnrOal6oY50EPG48KvTMTYLjOo2XStgrs2VSaOm
	82LUl3VXDCT9c1Pqe2lCFqupqcvouIkjjBsaMqfzf/xdryvzmLkopSNPFwm7qV4g2HCX/dk5ZG5
	azFvuoC7CxA==
X-Gm-Gg: AYBFou21HSN/dtgBeZTdswEyDXkBZdRGuS+WpawQlO05o7BajWQNuSBLcCZtE/X90+y
	c2sx1sFU3x+/8TaWi5NQcrOeoEpN6WZC/UPTqGg+cncJ1rcejDXNz1foI846pAvuHMzFiCMyMtk
	4ssVuVA5wLvxZlSCiyX9bzymIyH4OmImGu+PN1WsS+IFuUia82YnpW2Rtn/2BoBY/PZR2eSa9Id
	XEoyXK8Pr5DEXlwTTjPf6PVU2lGYGnT3Mt/+bEptyg74HR6Dtc/HBTazhDZKrgfhCRv0RdO+Ltq
	afO2vFxGp40UIsf7phFEcpT+mjbloCs/AkoiAxXDbXfazZi0FpmN69AUj8Wfs6xKe4ACKiaX9r8
	PnLJj/oDwCpNLmzLycpv+NuwBKT9QmWLrWtqrNOh54ktyvHyu7FiXFKR360Cutxd7XCi5gDZayE
	5bEKzz5BOuJAex1C5WmJWfyGzAcoJwI+7LHlAt8AuuI7L+BN06S8sWGW+nx9+13GbBt1Zeq1ipX
	18FmHmUWpk6HgneJ23IJgBe7TjAoLTfKcFIdQarPLBJihG39wp0so9VivOx1NWzlFD3TMZEgYK8
	txwjjfB6VLpr0UckLaJrfk8S3slVQ8aChaL+dRpP2UKQHIhKsI1fJ+2kDZIgBOUEGrewFaLm74H
	Op6cINNukSXi/Hx6tw8h5WR1b4Q1tguM8FEEyEH+alrspIR4=
X-Received: by 2002:a05:701a:844d:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b3c024ad18mr4159915c88.5.1794460733817;
        Wed, 11 Nov 2026 21:18:53 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm19764527c88.14.2026.11.11.21.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:18:52 -0800 (PST)
From: Joonho Lee <joon@deeply.co.kr>
Reply-To: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, anton.yakovlev@opensynergy.com,
 mst@redhat.com, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, mynameisjune111@gmail.com
Subject: [PATCH v28 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 05:18:44 -0000
Message-ID: <20261112043516.37010-15-mynameisjune111@gmail.com>
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

From: Joonho Lee <mynameisjune111@gmail.com>

Document request-owned capture in the ALSA configuration guide. Describe
`capture_packed_status` as default-off, reading a packed trailer after
returned data while the fixed status scatterlist remains the default.
Describe default-off `capture_pause_restart`: pause uses STOP and
RELEASE, then resume uses PREPARE and START; disabled mode uses STOP and
START while retaining the prepared stream.

Note that on MMU systems request buffers are vmalloc-backed and
page-rounded individually. They remain allocated from hw_params through
hw_free, and capture data is copied into the ALSA ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 +++++++++++++
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++=
++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/=
admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
=20
 			Can be used multiple times for multiple devices.
=20
+	virtio_snd.capture_packed_status=3D [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart=3D [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=3D		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound=
/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
=20
 This module supports multiple cards.
=20
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned aud=
io
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default =3D false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default =3D false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
=20
