Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464749;
	b=iKyXmtVPl01jl6OxnfadrJqc9TmB1bcn/OcPcHoTtEjXFskqY3WBVXncBQ4EA59h+WVR
	 /NQrgP4MM6slIR/d9SZZCoS9s9VwpTPFA0nQs90InpdqHLAR5kI7/9Q5R44R7yegoZ+8F
	 BHj4cmMLegCXWT+1Yc9hvDC2z0hcuGzB4BSDh1gOBYaHeU/Zj6/4mMi5kF2uFXBJ0YSO8
	 /2vNLXYMzrKd5kOZvG5khE2BY/PfpqIzQrO+uh66Tx4Q10rsnHmJ1KWhaGpopd6cebWcy
	 IckMigILEc0eIklxlZHjzGpz3kZnEBTv/XzJCFnX7WIbLK2JSpudLLnVwOQ0y0OWB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=sImcTaQ2t/+RqQxt6MWI1ZlbVCkfg1cx4+58k3Lb90CPI69rtExqo0M3mvyoy4ruAjlH
	 +Tmpv5mN/RGQBLg/bxIiPT2ikr7miVPxntQHsW0rjXreFV03B0UB8JzcMXLD0MPzmZn+O
	 XDMoXCIS+hDm91fjBd5lUb8W7OdGpXOvL4woEAv5hgkKC88EJKHa/2vS1tbm/PZu7sE4b
	 trAIayc08OOxct9U+UYMiJ4OsG9YT8AN6NmyVOvPffg+tdIvFMrhcHKc++Z7V2xlvengE
	 N59wjLbEa7WPugSQahyi/LbreudJQ/t9UI0YUYwITbQYEXt52AoWalcH/hSze2x4vsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E0060A2607
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E0060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea138a3497so23753755ad.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464749; x=1795069549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=LsKQS4Jzs+wXGEJdLf8qkH7Fcc/oQvJwEdPOojVmevEZeALyKb/FbSvjmLz27vsRd+
         dNPvbvWqEk5orKK0s8cKo84p9hCE7kFosWJhIWG2kkBJl7wX3ziVqJ47RSlwcMr+8tcD
         EjUfnkkbaA12y+ORwk93JMkLBccfKRA5ZjzuBMR/6hPO2ITdOjBYMcHbcM0x/I+v3xWr
         gc0DIOP5uxykyoO0EP88Hx/PNYpffu42l0Qenes7JZW0bjmVPNamxq2pKRYKls7Z2gr3
         hET68JfaTCNDjD5DA6/5Kn969iBFj5eNCzD4fKEINTA7OCqAmddabm6nXKHTO/O/jscl
         5JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464749; x=1795069549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=JL53yjj+Wbpi50nZEyzlj+5pArqHodiTevBZ6+9ga1EGXxAFnf/+qa131LLOqIdR/8
         qkHC3C8sK8bTSDQFklTuu3cTpblzUMXQE1yEX+ZYJZK9HQogKzTKJlrs8nXdzpqZHLfX
         HdLKjr82ZVMWFUTRpJBEC/xZd28G1Xe1Ajq/6kePtSjM3N11f+7BnZKI2jhzYDMl1Ytw
         XVB1zQcnom2FRXUftg2yMxd1WjOGI5PrfDghLBRPz1w6BHeDUok1Rh1KVKIXc7xHDxKE
         8ZZqUPCPReSOrm9/jpwtTg/kEAsB050Kx8Xa1EMthh9/J7Kc5NlJT3s95jCTC0T9P8HA
         s06A==
X-Gm-Message-State: APuU4Z+x8HTOG621p0oQ19ZBNCSzNJsNC2ln36XIa/js9gk32dZn/1jn
	UHHsd47ayi5bfLE/GfrNQQGC7LmbAhGmvnbYkcuDI6f2Ezd72k6pTdzxyNyMEg==
X-Gm-Gg: AYBFou1vpKF423GjYcax6/o9hlWrXRpkpx4oGH7YtNMcsUOEZXaL+tUY2wl8iTdvRIv
	VpHoDMiAelyGILX+42rZ7CPwF8J0Otls5yJ7MfGDF4LtHbomLCBBMuHDdr3cvGzn1YbL8HR7nOK
	dPHf+0N2gOEvaETM/PGJdeb13TEZOF4UnLLmyc1EXd/i0vt8wt4Fx75e1GLzDib2Ne9zeX59V7c
	igGqjLXsigE2B6onIokUCvxarFrWmBwRBeQTa3YazcThAy2PPOutNopOLGNvV1Qc8iKnujd2Ggx
	CLCWFN25GFRd/8K62zKx1bCcoFGV28pofLC0IwXNwxqk9KUHiKi1xgCrQkxT14L927qTpVEbSkc
	/uqVlu4wUq5WytCC/IuGIqURmMdhzgbmPYqcMhKySad3yX4sT05DjXV8KHFiZiDHZODEtlya2HI
	WQGBAFf8hWI5DVtCfudVEGABYR/P62F8hqI7yB8I2ulPwMIqOquPA01hOb8oFXDZ/cD/gySUofn
	72T/Nz/aUhUaDoJd0dW1NZLatxk3XbkIAR52eGLaDYFDC6x66LEmXBGr/o1UWy3Xc+eyVlSmEef
	02QZJaqPiOs/eXHqrom3qLh7ixlDSVeEreIUGEWo8Ppo+DMQu+Ec1QjtdK4/GW9r4jq+4jMwWmW
	NPKXpA2R/flAsrHUeS+i2uu3jxm/NygjnjTOkvqrHcGfrPQ4=
X-Received: by 2002:a17:902:ea12:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2edd76c1e80mr55285125ad.19.1794464748634;
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
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
Subject: [PATCH v30 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:24:44 +0900
Message-ID: <20261112062446.159-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
