Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0483F99F4
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113587; cv=pass; b=Ydm/1eTuXSCBhO+W+slyryO5ZfLjRUugHzya6TeEhaHMj3KwdSQ8gAWTiKasfki+0/jPnqS1eWJFnPivqE5qRVDrZAAh2A1ramKimI8RU5ctfq2no4k5jK25ljAmaxMqKqeOL3UqXp1URBzOACnCQvVBu3AL5/CZZFbQaTHqb3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113587; c=relaxed/simple;
	bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtakvcmRzq5nPAsYaI8CsxMpytu+cc8UEahZqTpoBd6BjbftrTQc/Orhn3coNTdgRHWY4d9EwP+3gaw9o2dvOfXgvvfCsiuKrni2OilTZc66CzG9Uk5vVG1KI/nnopyi28lBkTHMEtLTTL4Okmic7bnbyOikrPw+imHVRwGNQcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYm2gyA7; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYm2gyA7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so4369285ad.1
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 00:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789113585; cv=none;
        d=google.com; s=arc-20260327;
        b=SY9r/7p+mIWz3IIQfvurAlowcXPd/WoY+HLihdgfNrKffAt8+5foieQBvirhgIrqTz
         rb3j9w1hE3CrJwLx8lwhoo7YvlR8wk7zNbhFOsHUO9oX7fazjbAypujgJZVPkN3Gjaa2
         zgYSj4KP+81EQZr02W4nZsjl1lcA/h8QSpLtUb6Uatt4wF2iTqW3s0Ub1/CwEXG33z5k
         +1ooye+aRMWyD6OWN7L0TttV18kpnORHI/F3qLjTmHdTfSNJV4qEkzw6n7ncA78KiCBH
         mye1co0VHrimTIgb+Xh1uqqejIPoj5rBrOfFwIWYX084Pt4Obetbfr5TBkjLsqvBK/zh
         Gh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        fh=xf/zXor+DP7Ugj/2N86fPEb9nTJTNSRAJUX2AOuH95I=;
        b=srSOaof65sEOSyewVgnwDJG4loYGx30cMsP2+g7fTVQkRQI55a4195bUhaZ6V1MHQu
         f3KcCcHvqifT+d2CdtPmbOE3BLVDaatSEhmZ/etCTidjh7GTPaL+paOf5lKW7zzNp1Ny
         2Iq/CAgzAV887c+Q72zFOwGlyvB8pMfspCCihYDljUdR+PqOB+lrMUKKIiIaNXFRzFcr
         bmH7loWUxqVUcOmMkxGzdS+VMC9zn4tmNDilKLlrKkwnsKHCn9D6V3Z6+UvfUtw4mMWu
         CoDfzTAPPo+0l4mNX60MtYYvWaLwIcdj9aBKcoN+YaZjWITWcQGYgNLoBco0tlG1R68Q
         3MFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789113585; x=1789718385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=PYm2gyA7Ej6+cFMrGoWhgez2LwX7YS1fFoi/eUc898ZMihGfaXWaLVb9nECUSeQE01
         axlxdwk78hOZDZxhBwc4Jylgmnh2k7Ntewp1rbqKsDgVRTPYxT6d8pBiu8z+CqlOFS7t
         n654Q5QrbqrfjO7JWLsajpol2LrCpNQljUW8nM+BeCyOWt/v0rX+lqp0LOzgrVTmGip7
         jyuR12xRu0IQAJy6cNzUJUfttbo8MD5dVQNaAmorFESPqTREoMYxxFT8TGnhf0dWQfFB
         7F5IIGcW0gvuRtJxeNTpkKllDS6YJCHEAF57VMPkDxwyex8DMk/3OriM8EiHL3fh/eoh
         P9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113585; x=1789718385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=gKy6aOb6OgNNF0NkN398di/mq3njZkK/S75oSHGMxGl2tDwYkvA6GFae9VwAc6KgaZ
         FwDcMZWVYiTLrRGMyo9ycdSVU85LhynP82pK5ZloDC8XY+8XfubAc9kvw/xiq722coKP
         A9vhCoBQkQ9L5lERmhRI5b/rZnSAG9hBvxK94swuRFRAEVVcv/NmB4TOaMUCcqqxIOeC
         aIUz//5XHJCnpbPc32JemZccMPiHv9AlhZh6Q7G0ZnydbbOBm3mDi1coRTZCBMOVGrJY
         9tIn8CfwOCj80ifBqUw3inYNLIE9IxWBChKnNFC1ieXuRl45di1B/Nur6IpvCyp7Px7J
         ClhA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Gx8u2brsCRahow3erCMflbqFH+iSRwIHap3uAAGir8hMf+FY3Qj7VckUqAmRCZFvHLqXGckob3dsNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lHoReIAIExGQBSNNu37tyDXxKFwcyQlcUaZLHR7tMD8HE7eRF3
	LMSdCNScyx4bRNjvK4XK+htJsx6+o6w9cXQKvdCqHpNw6m93rIBvOt/s0xz/mrFhXn6UTudxHRm
	P06HdJvYiPjn/libQKP3YEBWm91Vyl2A=
X-Gm-Gg: AYBFou3yZa+Vt15cKAmOrcqn2kQotL3bzfMD7SPb0KhvVmtoECbKR/hbrvJ70qaAMzY
	rMffc0bb3RsaDFKICk61E+Isi29YsiBTGuFHMlgPUn1+7eiOjwcMBs9dwRZBjUd/zL1HQN1fsil
	Pl95/aXpN3G4uKVEF6WlASYnrDEnELeNt1VN2uCoIjoglmnLMFgW5xuoTdLHFoL7yHvWxqkREYd
	kp0w5Cq2G26/Bfrq8NYygwxOPnpCE64wUI4q62BCANv7BkaQvz7TAKd2kGeyMIg+bs7RXj2kBmO
	SKmtACb+SPup3JvduoNKd1PQ18snMTqZ0BrA2ubun4huoM2+RbJxbROVIr2f7+yF8vRZA5gfrH+
	nFhS+FGz8pwASdLhqSAwJgxYFCI4Outhu4w7uDGYAacEe9Euw4g84KVjjzU9t3VGEdgcISjysID
	PS9Q==
X-Received: by 2002:a17:903:32ca:b0:2d6:f6ba:263d with SMTP id
 d9443c01a7336-2dd300d2dcamr38221965ad.7.1789113584990; Fri, 11 Sep 2026
 00:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com> <aqKxadkfX9Tqx8JR@stanley.mountain>
In-Reply-To: <aqKxadkfX9Tqx8JR@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:59:33 +0700
X-Gm-Features: AcwNN1Wl0GTh-Z2Qm9Mk1VLPm1ruxloX7-jtdmf-ROLjbwYmLn7UVqKFYyP_TdY
Message-ID: <CAABR9nHCK4X5iZORmHkN_jH62e34H2J_rBLiWLkwcg+5JAJJVg@mail.gmail.com>
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
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
Content-Transfer-Encoding: quoted-printable

Hi Dan,


>
> Better to name it err_clear_mux_setting or something.
>

Thanks for pointing this out, I'll rename the labels accordingly.

>
> Since you can't test it, it's a bit risky to start caring about
> errors.
>

Fair point =E2=80=94 though ignoring all errors isn't ideal either.

Best regards,
Phuc
