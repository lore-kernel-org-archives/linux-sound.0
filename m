Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830400;
	b=3UlGpVy4dR4QYIvRN9HlgTMa/N6TJwLYVzAvOcOKtvzXefXmpQNPNP+F/hoY/y2NzUlS
	 rjjlZeVE47trgxFapR7tUtMQjihnZt+4ETTJvvolDLp8P9idMoZ3afH8PVqUzJ0NZzI8u
	 Zae0GF0B11MV74VVPBC3TPbF1l4ht8mG8CYTPrFqo1iuDOcYic8j6BgEYTeNWDQLzHpQQ
	 pUcdjOQ4ynE3dXrrTwI5YkbS7/0VEIb60pwsg0n5iNwDBQTp2hnBPlThVb8w7+ISHLOVW
	 n9eiscF+ZqrBz2/ysCIPkdOFPyAQpvAaiHD8JzjeFrfcDWxwg3KlEWi+qc2DdMATf8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
	b=1AeG2sUrodgDEyrKdhLA5w6izzST8I8Fj1PDNzLUGY7PtFOJ3wbQrKzMX2PYVLp4VJVD
	 sdLj8vQ0LFpCv1FDz+CZdbw2Eqgg78bVyNB34ew0osQy8k35C7k7hN/4wGTGV36xMRpNJ
	 VA8dynEgNpc9MrQMr4bMSQqXIuXHOxFaH+IvlC54pNp+F8K7qBhhWqECoTBxgkrfh/j0Y
	 7YXnjoy5oVAPcTK+D7lHFuTkRkYw2clFKd9vdxsuNkl+5UUVthKi04hVQAp8/fOiL/w3P
	 paiucjawImfLleHTrJ8SRDhLzY/vWVH5yB0JG6PQafAzm8z0Ih33HlX1B8u07o3dJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nmzVZfCr;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51C606A31D
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D51C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nmzVZfCr
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917ad52d7b6so15351466d6.2
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792830399; x=1793435199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
        b=nmzVZfCr2pXrL+EtREBKGcClpv1x2lS2Y/rofm90hyR/z7evX5Psds1zLlopJfUz4p
         tjlvx3T3Rne8z2YtCs2lJCzhvtGbHZMxub50xoYEH4e5S6xHMAw1ZBgnjsxn9HeImhH4
         PD/26m5I6Pu+g+Ga59CvKGWu2wvgOL16rc0F3Pwe9a2NHKel5LHhxUCENkkXc2s0iEAq
         CxjbzbiwVtQrlL9RBX+Jq16TrCl+pYRWf0Uo+u++H0gMb411Rz5xymm7MY8Qmf0lXvtp
         jOvz5pOX7m0sNIWI3XSaRPeT1B3ij17oGJcmaBEcuxhNpOaxn39K7aezx3MVzbWW5ag1
         CBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830399; x=1793435199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
        b=cbYvEX1eFrXPDzOw/DzHh+bdt1dQPhgtj84eV39FJut3BvGBtrOyNWy2Vvy2w/IHtA
         F3h6kZzmX52AtdVgsqAxldfMrX5U5aZ848/gRatAjcF+FYHshuao/xbHyPF4VXvz8isA
         batzE3044M/NzFtepTtvBgaWMYtvHPxD5leZyPzqr/U4x6rvt6SY60XYx0jryvjIPh6k
         1VxnMZ+c3kAx3VAzColouvy/ZFItVCiJHvPTQNM2u968Rhiu5EyJST0BI8ufGSgGF68R
         qXX1t05fkjsuO9cWuVXxs4a2NLyOwf06eFNyrcJomSkiXCiCe+TC+ui7bd90eYIemu98
         GfOg==
X-Gm-Message-State: AFq9FYJjscKUejy3T8O439aQZCaT4rRLKj8Z+YcKqDfidIpzyxv14bWp
	EakVFpmN+fIAnrIw3OQGOiVn2mHuDjvHNQx0o/aHDxRnAslyxknP/PV5
X-Gm-Gg: AYBFou0Zkj8jN7sxF8l5WlmmS/en/ib9s0drMZmHOksmKh9szKUqZSIzllXi1i0Pvlb
	i/wwPCM5nOtw0WXsb6qDovcQhkN3IQCxfj0zYvWK88V6d9GPsF5vhIR0S7jcfrENujQpTdsKODr
	cP3tR7CeL97aqt4rIDT2/iWeExOHye528d1Ev2DGJ4EF9fXPrp81/hAdKNSsftrGeygGU3jNclN
	nWukvp+8MX1isncPpiCdnIkVUZvSkKhGZO73ukfEK82Pdg09GmtN+Ej4Mcy3fZRiCFFV2rZPdYx
	K+C/4ER9M0ulJcIukkaz95l5v/jBX/SoG2D43Vv45Mm5II8IjEhM0s0hEqap7tpXk5YmR2z29mz
	Lo7elp7czhYTdywAZ95QOboohi5mNMYDOTLybJFxpbFplCJClal9RoI3PUbHpQ3HNtjlS5smsdO
	XBtkDwIXEiyF9F0yvXC2I62v5lSpg5Si4h+Umbdo0lh/b5jMMWxAc8LJ+D0DLh56jJd4vt0oH00
	UrHykoflmSoPNDploy5HneU5tfBbqFx5I5Fw3/vym08oJAu7k4YtrxSo1Jgu5ZKdWwltKWoNASp
	6veVR2MtjevsokVb+hR5m6grRqd0AoTjIZVCWw==
X-Received: by 2002:a05:6214:19c8:b0:91b:5d3b:7ab9 with SMTP id 6a1803df08f44-91c48ebcc1dmr22164846d6.53.1792830398964;
        Sat, 24 Oct 2026 01:26:38 -0700 (PDT)
Received: from [192.168.1.216] (static-acs-24-154-158-10.zoominternet.net. [24.154.158.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd5b65sm16066826d6.10.2026.10.24.01.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 01:26:38 -0700 (PDT)
Message-ID: <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
Date: Sat, 24 Oct 2026 04:26:37 -0400
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66
 Raider 11UE
To: Andrew Udvare <audvare@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909193104.26508-1-audvare@gmail.com>
Content-Language: en-US
From: Benjamin Pryor <programmer2514@gmail.com>
In-Reply-To: <20260909193104.26508-1-audvare@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Add a fixup that programs the amplifier's initialisation sequence at codec
> init, which turns silence detection off.

This fixup should apply to device ID 1462:1305 as well, since it uses
the exact same coefficients as 1462:12fb and suffers from the same
silence detection cutoffs.

See: https://github.com/thesofproject/sof/issues/10475#issuecomment-6380540623

Best,
Ben Pryor

---
diff -u alc269-old.c alc269.c

--- alc269-old.c	2026-10-24 04:14:40.174188675 -0400
+++ alc269.c	2026-10-24 04:14:28.725047392 -0400
@@ -7593,6 +7593,7 @@
  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
---

