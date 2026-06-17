Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F932EEE96
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664029; cv=pass; b=lADHSzTdiQNbMe+sJxrH6Sdbioi4ZJtdwhocqS4S102UL4sg2RYTbqge0vKw9roQSOe9uXRXk6VfGhgBe0oA2Lr+F2P7nUWnG9KQsVZ7xCdYPbBb2HiNreujqg3pp1N+SKr4I6cQUF9uVc6C5UwNkKHsSxjdPqTmvaNHXJwEgFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664029; c=relaxed/simple;
	bh=fw78xPFQ02MNemKZiCLViTkugkZcZXXpj2n8o0iyAaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LS7wZo1PKqVNNmiUNUrhIqcRFj13HR7CUzfqSAsZwiGFEvEcMpnku2Dh85aznkpYg9mBarAxn5MFfNrf3g8d+L2b42rxafDBMFJpJkw2qdmrSzeR0Bu1XX3uHd5VWX05/zTYcjPoX7DfgJqKQxbqq+KC48S7JAGCAUGbXpRa9BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT/LdqHq; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT/LdqHq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c86484d35d1so1948836a12.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 19:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781664028; cv=none;
        d=google.com; s=arc-20240605;
        b=haQl6b+iAMJuWvWfnwmyhTGjC0S6In6TYryhE8ZXhzifrAKBo4gMAwbrhCD8QeexE9
         cRt8MuDLvYFbA0qjyvUjqJsiPC1SjgiiA+8NQWYpRF2e3Ju+om7CmeXlI6uVR7KIK1GG
         /g1GSHhJY1PyjzIFoR2Otdzg6ee8o8cUeXlwKRfs9zl8XoradJFUFNjUllE/95QM0ZwE
         kN6Kx7TjfQOt/wCg0FIr1C6A/YxWY3kDoLpKD8dqClq+B1rwu+YQVo+94w6MXNKn+iYN
         6fxuby6zDN1+NOsk/wCZsLW9/oSp1AL42vue9VBfUasQ6D4xmGPUvusrbGDOX3Ttwnbh
         25pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VyL9J9JbFx/oyPrKBkcQl1xi7+7ur+KoabtHM53bt5A=;
        fh=BYuPl9M3f+tkRnxdppuvvlCiX1F4DQw3kLmIj2LfZQw=;
        b=UiyUjJrgd1qt1Oc1KFTaymuc22mGTgi9EKjSH/6AklsgU6PlictTAXlZysoal217Nd
         pRDRXJEKVH4BDjwoN9ZlOW5WDcPlPwdiGtrsGdz5CvlL/2iGeh73utB0HIMpfuX6pdWp
         X5N1Rdt+5QgfD37uL+f90bG3XoCRZoXoosaPjmg5rbiEskko9B6b8wPXGlajdpcJTKgb
         fgu7ylmNmKRaKRva8tPyssGj3trlEk9mtmE7Ox0GH8yyNvKZwqWiBjVC0GcDfS8UTGAx
         4HFD5JHtHWPLWSFph0sxak5YGw9rjqttgp5J0cnNDNGlEd+HT/Y1m9wPp30zgu+n6pPz
         XDjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664028; x=1782268828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VyL9J9JbFx/oyPrKBkcQl1xi7+7ur+KoabtHM53bt5A=;
        b=UT/LdqHqMoodql2UCNHTSmjX8c9hpJ+P9TeS/Y7SoVdnVK3B0T+raDBsznFwEkPq48
         L0pwpRWo6nIPm9TgnWy82nhkipUgVohMb7nKekJOvt00HgBtQTDfwjwZcrhhlwcWt+aK
         OWnEX3Y8Y0Y201XyN6QBO1RuormjtjzpAEYaWqG8vlb8bge6UXOE8YhXsu/SGK89Y/jG
         XevQ/GfVsFNvokVU3Oq/R4iOsq70CKoHM4RaEa6HC0OD0PyHHVEBVH2RazOdR7ssbLXT
         XPY+LVrwY8rlZKWigHjfr2ikYwX+PRoF061+yStWnaineap/ovzm3ddk3LZn0uo9kbUg
         3IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664028; x=1782268828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyL9J9JbFx/oyPrKBkcQl1xi7+7ur+KoabtHM53bt5A=;
        b=MWcNjb3K1J6QvUf0BxRUacOV+M+EAgA/lFodZjQdreUNI2M7+2qvsL7jySIix1CKC7
         zEiOpKdaS7h2Xy3QDms72QoKPjX0wXWWEj8m4X9MUHcxM3brUoqZ7pwVskmz3Ql3v9gA
         AslU1Ttcodk4Zt5GMRRmBdeE9T0EAPnRMduzfis1KxrUjvDgy8ev34+LH1YVUumTCHgi
         FOx5kZtZt+RGC0OMHCAUqeu+kgnILGwyFTPA8Sw1hbHAsUUF+72TyA5zcf7L4mEDIcyD
         1SXTq685+xGHXkIaRWVvZbD6iMT0ttQja3ktjGywNX+Qx2XU2OoEpZo5yU6L3MJpIn64
         pYjA==
X-Forwarded-Encrypted: i=1; AFNElJ9VbVB9AVCK714dDcQRhJUypyDf2DxLKBS4MyGdYMUFFmjtide3aJGUd6Qlw4XB7TPS4/1BA79d08cOhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfNsX/MMqNolRxn3eVBsPTiSIPJi3HB4XHLUwc101PL1whxTw
	dDPQvDqSSRHzb63V382hjZI/25Uqbv/TuZPl66XI6JktPWMa1jr8gl8r0g3TXDh7jn2dSoIL+0z
	oEUsXx/JoKhrFTQ+wCx6g12Cy/QygBBY=
X-Gm-Gg: Acq92OEOQwgBHK2gbN7s+s6CEg4W+rZPNjERw0WyXNoNyuFTzl/Pkt7h6bLPYGN3waO
	canVEmPtwtE4+JU0yMkjvTLqe1Z8n5gVoNbk1Y4/Dsqym/mGcbpY82bqz/TCRnsz5eiaEghK2/L
	64JOhFDwRBz60hGsH0UpYpahOj4KO4d5xizyxBCgfSrVO779O7eb/FWeKn4sYdLIi35TxQ1mgO5
	LMo4B3bAicT1M4qXmBB/YeCBAJ6z4J3iB90U+90j8FV7kwyShtgsHUlD6hRP+IgITppHRptKolq
	i5VT5LsKC7p1RJ+mPy4hAuzONRQ=
X-Received: by 2002:a05:6a20:9184:b0:3b3:cea:874d with SMTP id
 adf61e73a8af0-3b8b61468femr2108643637.18.1781664027825; Tue, 16 Jun 2026
 19:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611115901.80438-1-phucduc.bui@gmail.com> <3f7bcbc2-cf0d-4bb5-88ce-fadb8816c6f5@intel.com>
 <CAABR9nH6b8kSQt5w8vPGFiXGH3h+QDQdjKgsF-C3pa2hUh1Wiw@mail.gmail.com> <56cae2c2-2fe3-43bc-8b18-f72921464573@intel.com>
In-Reply-To: <56cae2c2-2fe3-43bc-8b18-f72921464573@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 17 Jun 2026 09:40:16 +0700
X-Gm-Features: AVVi8CeLGbOR5HolMkN_eX61d769_ku7ggk2WJcmHD07EWMT7e2c-DAZb3qJakU
Message-ID: <CAABR9nHptxya4BGGOCTzQEEzzbtCHS4gQ4PhU4Yr4e8HJf=xdw@mail.gmail.com>
Subject: Re: [PATCH 00/20] ASoC: Intel: Use guard() for mutex & spin locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for the guidance.

>
> Assuming someone is new to a subsystem (here, ASoC), it is advised to
> check the MAINTAINERS file and the kernel.org git repository list [1].
> In our case we're looking for sound/soc subsystem maintainer.  Both the
> file and the repository list will point out: Mark.  From there, fetch
> their "-next" branch, typically "for-next".  Checking out a for-next
> branch and applying proposed changed on top of it, recompiling and
> retesting solves majority of problems.
>

For future ASoC patches, I'll work on top of Mark's for-next branch.

>
> One could treat the conversion of open locking into guard() as
> "feature".  If a portion of such feature causes problems, it is usually
> better to revert the feature, fix the problems and apply it again.  When
> reverting, it's good to do so for the entire entity e.g.: the avs-driver.
>
> At the same time there may be no need to revert for everyone e.g.: the
> second driver, the atom-driver, if only the avs-driver presented
> problems.  Per-file would translate to quite a few reverts, again,
> unnecessary traffic.
>

Understood. I have a better understanding of how to handle Intel ASoC
patches now.

Best regards,
Phuc
