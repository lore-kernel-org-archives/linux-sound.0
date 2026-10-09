Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536063E40E9
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529909; cv=pass; b=tkAYn6pfu5gtzRULLoWIq5sUl1ELiWUw2Y3C+qH0llAFuJ45zcX2zWy7Rm5gtSbRB/GKpOfu0Z/YgFUiDcThJBZALhvkgGYpMhg+CH6QZCLsb1L5U6nyVsp5koyz5vvprIWYVwMEo105dZNdKxdOBjFSaGMhcR+hNbxx+A+zP5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529909; c=relaxed/simple;
	bh=QrSrgKSf1hovOqBLTLOsQ+qxIb3eiOpoDqgK2ha+Ntw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiXIA8XXYzrnE7VLSTMw2Pw81lRMd5hVFbSyF+7zCNNr2n2e5FAcEXUXIekgMajuuNDUmyDhIzzn8Rv7vXYAGem4RdqUix+2u4CFhuzH0HIQGzPhq90xwhMu9FyLTPG0VxJdsV9ZdgcDULooZ9x00/Pu/O/Q7fLtjhBzwx+LduA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bpyq0t1D; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bpyq0t1D"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso7639331a12.3
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 00:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529906; cv=none;
        d=google.com; s=arc-20260327;
        b=TcXvxz94dsOm8VFm56Imj2eFRy3yVNCDWMOcpEkMDv0nsul0b25bjdAXAbLoFJcttv
         Rld/enEeV6ZioDoc0/tdGgS67wx99lQApHCBFiVsKv9xf4vY7wWCTeyh4slwn60XV8gJ
         yAUQZXIS+UVReTe3uf3BjneYS8eq5vnsvclQewL+PUalZ6ZPQ1lA0UBxNKWZeXACvru0
         WvuMaBC2SXGoaT8SsGzO00iGkd5B76kRXHURrw/VjaPqhuS4NMxPyf3wKkPPgPmc/4K/
         Hz5XSLpVn5RDRtto7nOhCoQStE66jvSEbsYP//eRZkIq+KMAIK58eycTUAL5c1uNFO1F
         EgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        fh=bZ6Jz6dR5uaEG0J7bdk7yOjAgXJD5jrFe97psjlRs8M=;
        b=pL31unukuQ0I5Ybm2NJu1nYfUh+LDKGg8JHrtNDTVKPTKEN8scabaftih4CwaTBIKQ
         5gjLTpYz8nXekXonpWFBUnXMLOuJhcTByKuMf6EZpr2YJanaT1ONahaluLud4Os3PunU
         5lCrq9aAg0WPOU7r7pxvevkuFnH/85zoLaLmwmfajepp6sBHw1W8EqBuUHfyrEHXFcFp
         8zFSemVL/lYREVnX29cwLWfa2wUjK6nauG5RUy6euk2FoQSGnGlBOnhOFEwXJHVMJ9wW
         R85r8kT1pJc5OfNdVEISNs1HYil0Y198P2RrcnbvZr9Hf3xiA6vxO3mFuBxG/MSEUq2H
         XPWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529906; x=1792134706; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=Bpyq0t1DmWGdZ/7H/Qb0N95TunBunkmL7hqaAnNjbDiz1t+i6nvJy1HBPAASyNaNOw
         QZq6DLBBRZbncsY0pYlKu90vLvdFwrQjVXYKyMJPEZvMf5hz3K3fwuKatxKj3sWw/NKo
         o0g3cz3vnhL3A325i2q+/0iE+4DBw1+ZPDDfXfFHPmxvDq+8t3gorCfE8V+iqSBAyYt8
         0KKeEHlTyXGwGR+GGk+ObHWmnpi7L3pSXns9aKg0S/PbhcMXWUcJXamjxjyqcwvvPrJv
         9h9sUvmxZlqfPIJxJDrWJOHirnnr4T1rZprjg7Zd0j1hYldp+9ag3hd9aCW4TXvPddqf
         biDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529906; x=1792134706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=Qqf/dk0/Vdkmt5FxrDTu7NpBIluAfzZWoehAeROF9rmSE3dVPgldflU69t1mCkK/RL
         FioDFZYAlFLdupkD0Dx7tOiO942whe+bxBDZh7/7BvkW24kx2v5F/LaohQp3iMBQCJtk
         HpllLaI2qVI/d1x2qk72s/GaqJBhQMhgFyF5kCefWdjS/xavxSRTENgVyeAdang5LNW7
         jMCsDygfJW91JMZ51RhTk4iisVkCcEa0zzRUnkRX18UtjoyhJKRWwhjswV6ggIIOI1SB
         hkynNmvkGpKmcjFSpGbmbwNnqyOXrQOsRQgIlya+TLeXcxhQQVtl4FrXJizbVaVltKwM
         g9xg==
X-Forwarded-Encrypted: i=1; AKwUvBwssSolWUXogCc0svfZnBiVnL/DnNd56aYzkS0fuhosoE7P7qamijlq1lSzZhw/ryBHSj8yiufj5ocMbw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKAo2f+eeklp/t8EVK8Atpu7iZ7cLtLZ15vIbVuv2xElNm5r9V/
	bJG8cTfQXC98aByl5IjSF2NoGF2eU95G7vWOg/efL6D5ZVAACAvb8icm8vnp6v9QCwTrL8IoAju
	UM8DRvVbDL/zDK4f0GLblpSCLGDafvt8=
X-Gm-Gg: AYBFou2tze7ynyVETWFE/OyK5FqBUMZ2TdQLx50wgPN+CNemX4bqZ3YD7faymxAf1kC
	htqjB66VLGx5QVcZykRFbYllTz9G30bqlXyDcc/5uPUkUpNMf1Ilq3AKUxX8PUVs9TL0F+oX0q2
	6RFheVVZcQo5kwQG5fCiLDoSGdhVf17DERzXGecTCHuguK58t1EZt0VwLn7j91nocAQS4DFqJ67
	dZ4Hoenn7JouyxHxTB0rW+XzCOkUIrQv9ml9mTM0xxkKUhXZcc6eCijtqdBKwPWZOAxYynal/jT
	vWD/+HcUO5nvuIYIlEEROu/0H0WtGTl7uUqnvdkaVeCIdSpqfe+stVe+SCvQd0P72O2p6Hd+IbZ
	RAKZJtfz/wHCKai0lOVfXU70yvhRi4GAjJZzabWvB7HvuMWbcPJL7Fi6zQhPM3SHDf7U=
X-Received: by 2002:a05:6402:42c8:b0:6aa:9fef:641c with SMTP id
 4fb4d7f45d1cf-6b17c2cbe9emr672146a12.28.1791529906210; Fri, 09 Oct 2026
 00:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-6-phucduc.bui@gmail.com>
 <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
In-Reply-To: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:11:32 +0700
X-Gm-Features: AclHuK-rdOMioEF7bIiE384aI3Wbo4oyl4-CcCkNK2w8cU-mlh0smKvKyqU9pyE
Message-ID: <CAABR9nHpfwZ3Ma9pOTiY5eMN01Exfez1YahdUL9g+HCq2gwDXA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Should the START/RESUME path check this return value and unwind the
> trigger state if enabling the paired MEMIF clock fails?
>

Yes, I think it should. As mentioned in my reply to patch 1,  I'll
wait for feedback from the MediaTek side before sending the next
version.

Best regards,
Phuc
