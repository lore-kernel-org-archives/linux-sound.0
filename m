Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923647;
	b=kQdpttDTPm5ml212bpnbstEVTl6OB0KSy1HkvJARHHcdkUgvqIFXufpRflT7sUsfKAH4
	 9ze5/swDzpA41n+OlyjD4dm5nZftqCODHyODyBioRQX5/g+pVMPIGae2kfokqUXYqj9p2
	 HOu3dESx3Nr/j5wLkLB9qD7QwGKaosjiUBAuf2nNyHoa/NS+4G2W7v8XnMMspXHtCW/W9
	 XbERVOApL/NXNpvWGVEB/W5M9m3LM4IfjNFp4OVvj5KBJ4HxQW5e8A7pRY9bnNxW46nYi
	 yP6Og252BuvRwaiej3AX4p3yMrEUn7qv4rkOEXmWa8fkrjlM+CSczKORy8VxZmL3sTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=qEjv54zB9kXxzTzjN3iQYI0T7VYTo8iCE6gadbZMsy4H5YcF49SIFtDvr3f7pUuZxOAc
	 aUvvgh8vObpoSbY8zLli7KTMjTFMYcLDpj6fPYKWoA1kkw5EfB2f+EOYGaOEkabIz5Cg+
	 oegty+r/K730Yk6h5MhTHU22yWDciKcFbzJ2gCBAf9O1gqeZBdbRsNoMnhsshIZ/R3Pvq
	 E6tjMjfEtgSxISTkG1it7sZhInrpxHUc57NUND43ekLAM4tlAtxhq80AnSc6gU9WIRWxQ
	 zzIsfVsmweBOxcKpAqXUGsLR3qtHlJuQ7JeGYcGRTJuK27U8E1KPwYkBWG/HpfHdk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA756606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA756606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so386658c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923646; x=1794528446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=pBXSSoGEuH10m5jyp9FLU+NCx56gkVdN+jrBMziY+7rd2x0asHaOZzSc9l3xI2bLdF
         jKYLvPIeyJdX+fJSFopglZIGBX7rCx2njc0QMSE/uS8mRuc5XoM7rhZmq0ViPYZLJo7B
         9x8Jutl80kkWUslYi8OosZcXBpJlf92d18DkgE3DSkevFFkoG83VBrscgIUaFxxkl/QG
         0b70TBCwt43KsSavEuw6LzndMGuC0OzsWX36ownllGLePT1Yp9OmIY6juL82K6BrqOcP
         /g+9OLdSi9Ex5x+BBmKS/SERZb7Lh3rWEar4fVpCRLtZ4CXP+YUTWwSUhtRQo7RHlQqG
         1zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923646; x=1794528446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=0uG7NGxmiXibL/YyBmHNRjypFwoTG9nd6u0h96GX5dwZcyHrVMwAfV2z+1OUFVu2ix
         VdPB1Vxnt7Je1cs4oSHsKG1RMK/yr9np5V+ddVbKLA5DeufbwnbV0q09CQ4lsXlhIdu4
         oQPHI/kkDVDt5e0iiWQ7epNGZKDJnNIDCygfawF6kU6M3iZ5+jPJzU4Q77UJaz1LLGzb
         mo3DH2EqnbbjvLQvzvafYv0+NwG7xJzaZfyiOnEa3wd7UTc13rI4i1RHuCfmHD0n7JOH
         82kzQ5h1MXFWrWjhnqJjihKLSYEV7NwaxkUJdF3vtTd45pCf/95KZRdlETLmsj/gPoa4
         c80A==
X-Gm-Message-State: APuU4Z8MQARykScfAVElxdPhY8PczlQa7JD09EFZu6rI+wyOS9CuADPW
	n0+CBac1DJF4mCyWNnYm9yLqZqthHIA4uV71VHCQx96VERnMS++iUyfqiQPBDQ==
X-Gm-Gg: AYBFou1pyzk89dGimA4gEOluMXIhWvqGSFCULW8ep1Xr6+oSlF0W83chE0eECFCyAMs
	PVfdhc0rIGxYEcwlSEFBFWNPJVN6tqKyfbVr65ioYd4OGWEDcbRHvrd4K1/trE+0L461FRVSDx/
	1mZF+mWPqRwXdtv+3N0gW7FbGyuaenqA84a7UvGkgJAQslXEAR4SGmubZBlZ5LqqQpOOMI4A7oP
	eV9MYpEffT4FuAcvbESDosVMW9H7TxTgG+4icJNi89pedCSwcz4cUL+CvldncgcgITNE0CeZ6G2
	q+LmCRPRQEt2P5yPDY1Q1TO0JRBSNOgTAVxg0vJeEQKVenxOHN1qXaNZrwxsZ+1b2zfzAzziNot
	tL23PNsJDmEpj1uocwQB+fwVd/LUk0i4/Gx7Zz+U640QGNgLTO1B4ARFJOLWXT+X8PPCkbpivFI
	kkkLJZ6XEgco2M7GHQq7YdVES440Hl05wI4pzb1GXh+kw+njCFlTZODRBFsSt2hKZGvFzLTbyfO
	a2SqOrV1niApeI9/dC3bjUF9pXc34yNBUrRKBS7Bc6vugxN8g7AIP766EEwGDn0ZuFBYbaPob6K
	qnw5lHl4KAmEDWubX8LxFrZFqMKgHeISJJKIsOyqClCQHdSS+fUmwIblbGi3QWelsGn1jcztUm1
	xQad+MXml5F+gIpPbvR8GcvSMfn9Do2oyxUEfR3fEXje5jRHUj9p3mJajfTpON7wptoUJ
X-Received: by 2002:a05:701b:2618:b0:1b1:4c25:b64e with SMTP id a92af1059eb24-1b25d334f8bmr734634c88.25.1793923645841;
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
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
Subject: [PATCH v18 11/12] ALSA: virtio: prioritize staged capture period work
Date: Fri,  6 Nov 2026 09:06:43 +0900
Message-ID: <20261106000644.20460-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
