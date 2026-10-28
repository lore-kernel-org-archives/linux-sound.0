Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793184267;
	b=GCw6aTQXaIwnF8uucYh8GmuPw0r7e2jUEf5MMgKnD08uPvhnVYiaNZZB6pJ/oe11lb+m
	 dw0FUEmrvtoZ/1AMk+Fw4dCr1F2/XsjPbAfCtMGGZ5Vbp9fXBdXMi2dEBvJTaKCNxxNgN
	 ofw5DcTWtctoaVWedtSizFAr3tw7j+WxeigI3EysxrEMb7hd9EDOnAiyALhqJBdiNKz0Y
	 vDGwowexB4nC69EOKObuWELvkRA0W3bD22pOdBI1UQA46LbLQg4O1KR0jGAQGX7Bk3E+Z
	 2aheTDQASFc3X94h5vf9LCf7aTXHG7BMa1ZKAdasqqHLeSXdtlWyP2Lk2thCtFehYJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
	b=hc0qw85nWhK58QJqilBVa30Frz/b5kG/j7GdEa8OBNAJJRaaLZsPnzw+OSESHl2VcIcx
	 4Bz8FPFxEo+c3Q2imA6zeeqJeeWYn+3NY0VDmv8S/EmIcARIWIurieAeMK739/me0QmXj
	 JhpNBawM+WQ+BEaIfd17RcmPz54/9h5fSheA/fUQZbna3hLiH0vSHoSqn92uFRtnDfJdQ
	 GpjMi+zSIlCTeeQyZqc59ZQ676tjeNKZzZmXYUaev2CQVI4U25Mgg+5WVw33fSnbg16ED
	 +TXCPpAFtqXa6NZWETtzA8eFmkW+GWjpCSgE56bQyvmUViDoaRfBj2sOidMVEqxAzlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8CylCRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D3606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8CylCRB
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so5100125ad.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184267; cv=none;
        d=google.com; s=arc-20260327;
        b=Du58IkWIAq00XLyGi5Pbs2hK9pGG7NnEIrbeOr609ncpujUwYegf/Ku7I3wdFeAink
         TcRHX7nha1ULcYZYt820tU95VSEIKXm8TJzUpQyOT1gHNZYk5fenJPEsEAy6+UhfcdB6
         QCpTDQKZJ22dg5PMqRYaXNNRD1aWNewdGk2qeyG6s1/g4aSXxQJKelUqBbvRLEQ4Xcvq
         TASjXDpHOFNO6j64jCHLo/LCZWIB2FIYFGR5KPhAON7QzmpWzBnIOyMxgp8K0Fmjl39r
         KxXUicw8gidyiFJXcg4U3hIP1fLF9y5B2MTvMmLe+TjBr0Qfmfl/rsfR6+gDFoLnvkNi
         kw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        fh=2V57y0hA/plhMQ8eKnN5d1YVb2EcD/y0QBHtWYPy9bM=;
        b=oa7MgaD1aym1nhalLMI27sQ3K3ErhSqWMLsveKtjUkgyiPRCOFov18RX79H0aTI+/K
         u0yCwOel3xmQdbFTm+epV3G1IKqjvx5XfdIB36RGFxPGIdomoiIy2P15K/PnGW0k3GPI
         xzM+7pcv7BgP8bh0zTYyTPckPFwCKxDM82qbJ36E1N4jnrvmKqHNc2nNQEd88MV5HuHR
         lESxaeds4atCGcjNTiGuHFofZYZg+Ntn7vDY1SwEphCkIePFaIjZwqhPNAuHZAj4kkW9
         sczFjeE+PxN7TF30EPBMBlZetshZWDSsWdUXiDAhaqQtqdMOxyL+bG3GThYqhaAjB+Hn
         gfYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184267; x=1793789067; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=A8CylCRBWERk0XBVId5jt/uthzbZWRrSVvi2OVVVqVKWi5Uuj1XCy9EvM4bZAVSLt/
         VK7Jlp9XVCt7AcYKAYRxs17Gi4jHsWMhkoMORklHjaT2/UAdor5OBMHwy9wNFBnMzWpb
         +6JaRH9e4tnZuKWRmAf5gv1HwzY+5f/y5RKMrVJa5H7ZFsv+ZRgFA2pfAqBCtE1ixrtn
         bUBjzq7pQZq+439VWPc17uH9cnnxVD0CfnzPhVvmfSn/iGwKkJATAJ6YCLlIVIrXNPUP
         84jUzkSNpU1tMIxn3v1Y45Mc2KWvakcxuA9kvHkDOWB//LlwIDy6N0ZxjVZbDD3WVoD4
         od7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184267; x=1793789067;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=mfVmNQ8WSroLJyB/f+Run38jpvK3Hj8pIupKWh8cCbdR0jCY3bBO4W0leuTT/qHjaI
         lMpppN9XvL0QMYLvRekakug++8Qpb2D2EAqmMtzOnmeOoDQT1NZHt18gjbiMFFjhSEn+
         sHZGGhUv52TrCxUTZQYE8CmhXuH29aD2LYGR0YVBnu6X99h+HXyRaNbB2aowkOJig6Fi
         UL6N8FjKftN31dfPCuCJFV22eECP6Tb11sI3E58oa5Re7etYQZUxh0HlBQv8An0wgTUe
         FuqiCAHcKYFtjDRHFuhpWb0eJ0TcM1Ie+g1HN9rzjZeCHND64XOWdU1EQSutmHqirnsf
         JwDA==
X-Forwarded-Encrypted: i=1; AKwUvBx2vrV2X3AMTDeDIsDwc11MPGKji8Qa4MOvL4HWuEKq7aVtNoDmx395Vkx3XmLex1Zb/llCQPuLXDcaGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJeoP9XU6rboY84NdrIo6XpklMu5zHwN6PGNBSfblJ5nSFYhYGX
	TmqGnYPKFBhiFKijZfvvWJ27bc3KgisUR+utUoID9pRMaxbBJfu8H20PAgrKUHvtlX2gy12wf9B
	iwvBil95Y4rcoHURybSiRm42SX+GCC1E=
X-Gm-Gg: AYBFou2yTCwV/Pus7a0wqrK/RZdaLChMBXfC2MOQ90V9Y1EjTwxEawcJ9Xr+zjpwdY3
	KSlOwe3OCgNQY2kE+g/Vwe94nCBotAzyZs7FH7bvFXjlYS4ikXh1Xor32M/Sfzqifng/Bo4ncjl
	FOnuqDffJBgBqu9mq0OmN8cin/e0eThoXvHGXvCzREKb+/CT2aMqQDAlRsxm3f+G9RPTLPw0/Zt
	9IwuRGu13leEGqInwpwJFKHVlFpVyNTH1AbwrDPqtFDE/OVm22ze6K3J+3Zg+jLDw4BoDgWN4hA
	crjZkhRcU211rHW3o/+awN9yU6ecmYpCbg9CJxg74OU0GlXxgsFK3YJLCRXK4c4DPDKgAjxoGpK
	K2x32Am8uFCB0MkySN7trb+tIMfxEZ8WrM9yLybVcqKb5G+OxFtnjBgvWibVvESRoAJl65463A5
	fEluVUt36CisnSAfFaRvQgdvr1/whLIzyX5xzbT5YShZxDsJyW
X-Received: by 2002:a17:903:1b05:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2eb003e9deemr18278615ad.40.1793184266731; Wed, 28 Oct 2026
 03:44:26 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023102818.523331-1-phucduc.bui@gmail.com> <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
In-Reply-To: <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 28 Oct 2026 17:44:14 +0700
X-Gm-Features: AclHuK_exAGUSFD09jwFsm5vTmTuUEGazo2C26fC_zaBNTIkZVwUtRamyW3Gft0
Message-ID: <CAABR9nHDSHmDwGSS8gdBp5mAwuVJnCLjK=_+9VrHjH4zqj7p8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
To: "Gaddipati, Naveen Kumar" <naveenga@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Naveen,

>
> Reviewed-by: Gaddipati, Naveen <naveen.gaddipati@amd.com>
>

Thanks for reviewing!

Best regards,
Phuc
