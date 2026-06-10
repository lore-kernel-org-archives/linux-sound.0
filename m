Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C7466B73
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106562; cv=pass; b=HyVS3rZHKqKyZRzULszgBwuE3UXe9kn+ozYyEfC7LY4xzlh8or2DI5EudjaZFcN+eJzjKb0Vlbils7kqxKxyk40ck201UtgIGxndGSVCw4yhXbRKbhIwnIttfYBpYvXgMgzD0CZ89wHl7SMUvmE/w4OeNc/OM5bdlvs3bivMrFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106562; c=relaxed/simple;
	bh=YeyBR2elHrxfkycuzA5dct2lwgZEFs3Dlxw2M2FOFRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exqS0//EG/KrnHZXyJPWpjpCRtkxL3oaplif8+H1+kvad1stTzR0EcSIQn9TUTuzKdbO07+SKlvM69jLqs0zmMUQDoO/fnFuKyHxArZPO83M/VU7OiDwpPqiQkFeJ8A0q+rUGLTqrS9AuRhskWut74lfW/OvV0OKtYuUZWpddE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFFqzryz; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFFqzryz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423f626a65so3022279b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 08:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781106559; cv=none;
        d=google.com; s=arc-20240605;
        b=Jp8bBOQmqxhyAsJ1fYbkTC4Kyr32J22ITv8mBiVoEWuu5bF/pzTm8rbZbHIngQKja4
         eErCBX5etHPVlLJYom9sspB9MY4LkaGLa7skVD/oMWpq4xpDRxhihKPndRKQ6gWrituu
         TF4Y0KtF40WZGgvzOsoHOso7WJ2JfsQQ9rqlNT/9V/xi94YXP/i+d66De/mkl83WXgRX
         Z5hquNhauOw5rzhIX6uBS2bPBdFvpspnfCa3rCjPBdh2Wfpxd/3iL2cHFLYLtwf2V9f7
         AFCJAwAJQPO1nZmyj5+zTeNqcSJo+o3xXiAC3iXGPqe4m8esZxzPmwJhGAmYPnCkC6iY
         L6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        fh=TLNXt77dv56LOiqvRDdg+UY1xk/3C+Ii0ve4nSsMe3Q=;
        b=Pl1KZo1beb1EuRDiid/vszMwyJ1js6fZC1AtS2JQeYxi10dXmDvYmzw7Qd0/qcHWPq
         d3EEZOzSXeF6JPhmSK5D+Hz6UqpToHiZxQHWMGAGUkB+LRUZEkT4x/NOdqGfXbJ9EQH4
         c5tdEjKNpaA87QqoPMqPWVwaB4C3yFPZDr6dus5gtwAHeZB8Wqy9oMXlddx2wqdihY1A
         ysX09PnQc8AEoW4iwVReBBItJnMLK2Uw1R9Lrbdit9vYeIZ3EFl9x+7o4R40xQ6eE20p
         AKYZFbK0lgS9IF27FMhKdrRw5wL+kZKHjuPnZPkFxz8qEK7aq5saPIzdt24L3zjISr6g
         gMuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781106559; x=1781711359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        b=IFFqzryz7NLZ/+Pjq9GqTLHwW0lDmfxRJCMIZCDqEKwCaucxlKSbVMZRXkcvg0iZuA
         h1fBVoXf0DSVGd5l0f5vtZSJe9TzHH5PdCH1d8mro72tLt7nb4LWLesqz1ExPCYqcb6l
         V+GPf5r/TRBHsx2djqxWgeusU6555TK7ff12/hMb9oZ4hqcbzZ+XCrDCoNHdpsOhh62g
         qAg/TvSRJzJlSCoFhD1+2eWaa9bEIFbUrpRBGWEqul/Macg6BLn9DDelWLYIEh8ziBkj
         C6QN9iEiel3cJRYCHAKbVf/eNKeZpFgAAtyrbmWLEm57u6trCo77HFrDh7ILE7Ky2Lvk
         5ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106559; x=1781711359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        b=CA0/JJJX7xDCGmnAv1R+MltjeNRP6/YffS9mE8wAYr42tPJVzyy7Yn6XGw5o+H3W65
         4QwVh4mB2eJpKD81Mlg5shstYNXQXy9x+9YrK+ubYImgnyMOpQCzRqiWDccQFI0C72jW
         ryrom15ktlecSMe6K2Wh8MCzeF6LvZNG/8bUFagIS9oTWhsJ/XBnkBxFn88Q0qmvmLod
         YCLAsAbPtxvrQ9AVoQ4qATRCvcuu4hbjWrHlIz6dgsTw4e1no9Yh+A90x++Aq0XZBe3H
         6Fv6fQt+pQAPEtJww3cAJOc59l89elrnN8yhS2JiwwMGDTVB7cK9Sei8QDMEhKgp8Woh
         ovWw==
X-Forwarded-Encrypted: i=1; AFNElJ/cCH6a7vqErRbjF5f2Dq4vnhkYAeuNWm1ngfmvolR0/ebo9jivdcbiEzvK+qRbbSXBGrYdZbzTc9kTBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98KuMrBfhWGBt0qUV7P9vEhMcHPFmrXXTgpKNCGBONwezCTEX
	gbnRoHAmirArqC+K6oRiyleFyjfaHQZeHFd6J3I+car0Mne5sAIFr9NANVaMBwK8FgcoHLaHrMu
	ruKtB3KIEEmKE4bcCIaV9dP9PrSnWu5A=
X-Gm-Gg: Acq92OEsU5j3GPFCWYyrIGx9We8XXcaufy7F4J4VtPxaQXC1Fc/CGfMqFFy5LO9Kxxc
	NIJaDrvoZu6y4B9fGeXoG4jTmSCO/lTJAMAEt9tahAFGqNFahrbtpWPPgiMDCMwEmY2+MkbYLak
	iRDBfWJ+Rslc5s6m/JamTdV9gUnVs1jivXBRpgGCgudd2Luw8dHn4BI2+QgbOvK5DLN2rYQRyaa
	6NtDZkuXrlvf/nheIETTiWKPlbuVea0WrLdObQC3pj0GbH3zQIF97Ba2b+SBipNUXGAMS3rW9Zn
	SIraUMO69rXwfQLDFdMeHjqhjxeSLrhw2znBp8IGze3oBHicNG4dvPjmAEfMnPMZeUGZD9WKyBH
	Mxys47wM=
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id
 d2e1a72fcca58-842b0f83825mr27414215b3a.32.1781106559343; Wed, 10 Jun 2026
 08:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <178104804456.232889.7203992010119048881.b4-ty@b4>
In-Reply-To: <178104804456.232889.7203992010119048881.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 22:49:07 +0700
X-Gm-Features: AVVi8CfnuLEls0gWL-kPL7vOI8Ak1h2Sin-pMsKBpL2ilAbWUniKUhlFxfreSBM
Message-ID: <CAABR9nEhomppec0TnkE5YnjzfO91K3JHKY38tYe0FQ5-OdsQKw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
>

Thank you for your review and for applying the patch.

Best regards,
Phuc
