Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409394570D0
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112884; cv=pass; b=MjT4oS8MtwpB/fuj2u/pesXIEoMe7ueQ7AhOLU1D/ulJVWvTLrF8Mz+Gru5pNv8Mz+GYMjuEMMnB1mU14GL0HcivfWnwr/qYu+NiBGpJOgpGAK8yECElbufcJGVQFgRTALiqDPDduYWCuuhsrijC0/o+eFY3j3zB2sE/oCVbTco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112884; c=relaxed/simple;
	bh=g4LUAxw61ZG6O9pKjlfTJNUbYSvDm0/NC8AtOOiAsqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+Dw92D62w59cwJ+N3ijokX4nGU1SndLC3GOaeN8DPW7Xi2ppDo5nonLNSm4TAY8GvQMZUK8oNl2FyC8i5u/pc2aNyEFG44tcDy6PysPy06zs55qQvbMrB+hmWktO3MOa2dYJKyXChCVCmmjRE9TESLujMxRoahib/CWU7O0d0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0ko1bm2; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0ko1bm2"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so492135a12.1
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 00:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789112881; cv=none;
        d=google.com; s=arc-20260327;
        b=i3Ax0SnucA5DMHelyuS8FeftQRGV6/AoVsTkIVhpOpW/v1nacfBpikIjSygrTQVmui
         FvXtw65ukf98tyI1KkwXzm1F0qKS3G5nrgWGrMTNWKM8ClGOZDzIMSetgHnCZzfN2zIV
         byvbcxw8MiVR5Sebo5S5GuEI8lqQj8r9OHHGLYtj0WivPlLvpBA04t0g+sUjFyyqSUXn
         kXpQoeuuzn6YFQ1yWVacVr/VJ9iW40oVGs33AE9etdHkBkW9BLslXPrqzH9OXTW58co9
         ku5KGgQiXm5wzROQwHpDF8xS5iN2plLIV+DLA5M0S7bD4t9eLPW/HdYdabYPuYmfVjGY
         xxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        fh=MFoQjwlCfaZw0u0pEfeTBQ1WHpeCfsyTc9Gws+KekiM=;
        b=N/4UkkAR9C/uTPGF/rRN7SUxSn6xA9mz2hOpDZLeKpg/ldtXPx16Hi4zD4O4vk+cKI
         LLHfJHBjRbZzqqJF9ZGp8vqeh9CYQz3ursQ4hLm/q0ndfJLaEIegAOAbp91lBiYK9geC
         Mqnic5gc3dtssltcQtE5/xmxCFhaqG0bqxlmipkmUjBrC0TBYzH5II66Dk/fXluuho+r
         bX05C1CXj0LzVIH159AJbqG2h3vkz9ch4oEiWaBH9wKNQXxqCTGwAURHPC6OPIR9szYA
         +1cmynVFjgYLV1V30lLN3QzKM/xZpm7ZPTgspgQ5bhTLmzMZBXPsXq9cBJndM34T2pS2
         6uXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789112881; x=1789717681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=M0ko1bm2g5BnN5scV5lXZM2Dzp5AObWEXBpYoIuEPjpf5DbjdLxxh4TM8q62ZYEcNx
         DPHvrPoMeRwLvRQTAJD6jrQD6c2rNYdoPu+9N1PuM08ZkGcLHnrCafBb2CyTYF3jo3vP
         j7pZQOBTDGqvZAFyW4bi5GazcCIDCdDj0OM7Un2INp5gxYJFRNC5W+1LnJNfO3gXSwsD
         X0vncayKdVOZyqR2LCu4d0Msnko4JxcDPhHemO4ijMrMYOPxYZ3JJ/iPntuXsQm9xMFz
         20I04ZkpvBo6+ReTYczXZyq/Xyd2HY1jf7oOfQoZyPpsYantQ7UJrUFdtuNmYG/VK8xV
         v7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112881; x=1789717681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=ecgB73cJ/9IDGu88hS8pB2Ocz2b7UVWhEg87xAMcdcItOpYQB2XONrOZ1asYfi1XfH
         1j5EEvhQl7zjJm3H55P6VLtbH3zeSu00JwQwEgTDa3l2q2H8OGFYSpP9SkuSxhWQTXzB
         yG6DvCRMCtSpOwqvTO5xeZrf91IsY+G2mg7sTMV5ashQwJ7Z/ugxMYXtVRLBn1K7GJik
         Oc/jBBZ2QtrFrxl5ZgN/neZYFFlj08n4+KynaXLsKkji2Y0k/8H2XoaS7b8cwU/wASlT
         FUMnBrxm4c/DKUONw5oAqcVj/yxNW83Pc/RbEEw5kjoiw3Mfk+MBUijnWfEx7oXmnGpO
         NCBA==
X-Forwarded-Encrypted: i=1; AKwUvByYsmkN6rM7ivkUGRT0pnUnl2rNMi5e120JbTuSTSHUOPn68ezWQMCrcFP5/TjJ2KJV3Fv93Jf5PBhHig==@vger.kernel.org
X-Gm-Message-State: AFuF++mywfwQp4/L01niqtnnZ+4oViXZqNWAWYGm/3ciGE3c62wzt4Ab
	PmxCoEz6i2zKaeqWvSA29Q19SJ2DXp+3x5pXs81DRP6+3Nxb9FnJ8C1pSfYpQ2IRto146GYIaOI
	emhUdQOiD10wyNRDh5/A5t4NiIN4i4es=
X-Gm-Gg: AYBFou0hZlZH+gXgOoLn2qThCXWsmJgOpGD/fvYa4XkhFd5bO6arsV3OqiboZP8sqm9
	3EACEKa4cKFQYVNYk+7BpS3TBTHIRLIUcXchzE59QIyfz63SlBrPJwMZv5J53++enogojrGdshx
	BekWnxJNobcmpyNRrSG6GNI64NkxWF4fS20t5PbzG3KXufMzIBc8KdOPnbHH0eDY3bfK83tYq0T
	9Q6I/CWHMEEPtOY2eYa0JxSYiCdInf6rhqTLzsZv7uIunUOetZ0Yt9722b0W0/5OT5/7eXiZyrQ
	a40lSZDSVorcKc5sI+a7XF6y/qSY0hQkQBwl3fuUgcMCaLQtDwSIRa4i+Oa5VZx75jipexpqKDY
	34y1/GNl7ueeRoC21CW/nCWnMQPTYikYU9lt8uj6A5rP47Q9xxkVYT1NbZfxONBdyQVI=
X-Received: by 2002:a05:6a20:a103:b0:3d3:adbf:7779 with SMTP id
 adf61e73a8af0-3daed3b7ec5mr5165165637.21.1789112880724; Fri, 11 Sep 2026
 00:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com> <aqKwGQDkB_HruLyQ@stanley.mountain>
In-Reply-To: <aqKwGQDkB_HruLyQ@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:47:48 +0700
X-Gm-Features: AcwNN1U0HOa6yp6q-cu6PKO_-PEzbPG32NAKnqHP9l3WjK-sZPO65dMRXGkz238
Message-ID: <CAABR9nE+NYF23XqXCZiHaK7CXhcmVKLznB5Xz3eDr03NCM2dtQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan


> > mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
>                                            ^^^^^^^^^^^^^^^^^^^^
> It's unsigned int so it can't be negative.
>

You're right, thanks for catching that. I'll fix it.

Best regards,
Phuc
