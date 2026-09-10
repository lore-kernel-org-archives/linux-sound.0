Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FD37B40E
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014806; cv=pass; b=UaiPv7aMXlRgv1xDwJy4xdJ72iAlZFOEstr5fam6BZY6k7EZPz+5dFHKW8plrJhcHjU3MirNwx6tHpLhR3OdgLrigd7YzB9Ot2E84qcPOWqofwIZA9Pa20A1ePD5u5DrxUqMy3C/XrcXK8lf1SpMLK9uiqipZRv7AKdlthHK47I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014806; c=relaxed/simple;
	bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYClpJP+CUXQKHpBWCNxBz65J8kFxdXisnsztNCjhaOGDXITg6JE1IwYMkBrtHO1EMH5bqTQadwtmRF+TVmwwXKRKRSON8L4wSzcxsFpHQwHdDtdyLUR2cUq0WhYRP51Akslxv02TG2FsNVbGWpuwZxoD5bhadB+mLUHW0TScXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPW4EOGO; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPW4EOGO"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso757250a12.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 21:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014797; cv=none;
        d=google.com; s=arc-20260327;
        b=MGsji1GtwevQeWmq27iAhmcnTXagaqpE2vGylLFKjdCzWvoSZApxgpeLoMg83rdrnT
         V7E0RetabQgWW50aJllIIr8h5FIu8hsBwXDwR0tYwsr00xHPTzm0sDNxHg4HuDFEAHOd
         zQr1Tz8Jlg3UOnMEJwWpzc5cvY6osXTjpC9g7LiNfiQscRa8fENuYsuhtcrh3z8lCCuD
         RuXTDh7SJHVYLFIfpjPUrkaGtafWD5kBDoAXOSg4XRzSVnlDnFvl9IlFwCWMovS2k8N/
         0EGT/k98lT1OPJstjxzYNOUf0wSEa4wMfzp9pRmL/nB8Oj6iFBd6+Ft1PL9BNRfy+cY7
         kopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        fh=C/lxPu1/Xpj6dlgZRXTH59hA8+XFh/JWSifTfoC6UgA=;
        b=XhmoGXyk0w7ZNFLck5ydig7nvjePZ2QSxFcd1SQghFaY7gCQCHALiTyklr9XM9V0kE
         BXtf/EMgwIntpXMpEcd0J7iJ1hoQKDt26gF1l4CE0aKeQ+7pBpTGtcIJP9JZIfgo1d8x
         vxYZmY8o2nVQAto/XE6fmiSmtyA4GpPk2l9MmDgnOCyvy4ddNdUBc7GwWItJMm2wocl4
         nVR88rAHjm9/2MwfWV5C6Dcgibn8CjgFlhpQOGMdjANxEoHYHV7DW/uJ+ZjTleBiXNjc
         INBBBESjYHpScCDU/yuIa1RgbJLkowKE11XJW390mnBN3uAr/u21PkrMik833Y+X2I+W
         5Z3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014797; x=1789619597; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=ZPW4EOGOYXydmmQe+w8rHbFOV25UH3Ht9q5dKwT6yC/bQ16eMBBr7MYXy9zewDLMKc
         H/0TmsrLd/tVvm1bh3cbB5h01XbrGDl0oWdMb5nb3UP8/biCoibOZCCE3HJh4DXD3yCK
         61YzP42wLEZ6NaVN+lWiemQvBKNwqtfOLMVrgDlCC4DA1L4+Tx0kF6QBxqbuocjns6GI
         AQ30eFix8/FyA40RniYGchuX5oHd+dwnnxJufVfRdlZJbxM8xr0YQaInXVL5bsuOjjdA
         DqjKyPpBoa7ztMI8tWBHQFUCCyX5gqVxDVzN81iV6yb9KBxHDggObpJXnWktT14f0INb
         lsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014797; x=1789619597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=oFBxhG7+Cl6wBr6d/3GQuBkhg9w7+JoCsUPHhhq6qtSKEv1cggOg/O4Mqj3MAl+v/h
         8YyoN66VoidYih65cE4MxdnBljxN57VpF7p9slrUBnfMm1soz8B/qmTKLNmzYNqYI3fg
         We8eoPTKtcOO7to0Dbw/+r7rAqt3dmQWuRr6oCzdoZxH5Kb+b8iYPQXlHCdsP137fQE4
         y2JO5Bcv3ePSV1UCS+y6CM/W4qK5bYxGgetB3ADq0/NbAfdD+wdHKPqEjqWH87oozSvv
         NnM9W/W2CDmK5CH9Hpo8aleMJofPSvzfbHAEw52dDTyazMJJuj7jFOz5tyGvm68iglqc
         ISvg==
X-Forwarded-Encrypted: i=1; AKwUvBwKLnG+iw6eYyXyrTPErSd7urACLhXtHBF5Od7LX2gV4dw/j7PHHHBRpjr90b5DlDJ8i9TlINgnwkQ73Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nIY1PL72a7wlhZF/Pvi/LSZ40XLuoe9PPwYZ6XBFkRY7VzR5Hl
	DHPFZAproiOjnOXMzifavORl/cawGNdlsP5m5soK3n6d7TNcCA/MuIcrovyaHMbHQCTtW/vH5JJ
	yqq0o7xqWl5edNpfG/vzMCtK2u4oODDc=
X-Gm-Gg: AYBFou207iMZoAGB2w4x1xABZVK/XZfeZY7Jo9rFpfOJJ+/g64Z+NzuEVlSKzI969Q3
	2HmO/LJFhFZ4yaD1giwC66bYy4wHYCfx3vRwNRyJjhsjZc/4P+iYVZhy5qhyP93XrGJ+RGSnaMl
	Xnb4pkCzmTrGHWMCuiVg41osExvPvobaJuavxpo4b/yicGRjIOWPFTQxhig4AnjTrPNUGL4XyMk
	tUNR6zc1L14nrWviwD7eeQgr/yJEhNq0sc+E60z5uqc3wbXdcsrdHiDhXEXLvYlaNIV1lQwMlRm
	PiwVKBdv8vq/iqFgZI3aHJAxyIhHKVzL+eTxg7eUcyqqaVzOAMcNbGq8mAJrwa+GQ281CopIgit
	tXoIsdLHYMjufcp+UICJdoUyRFmTy3nizlkIINz53xriW24lDN5/wfvFbJXnv5sPXZg8=
X-Received: by 2002:a05:6300:218e:b0:3cc:2552:ddd7 with SMTP id
 adf61e73a8af0-3dacbd6e443mr7502421637.5.1789014796911; Wed, 09 Sep 2026
 21:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907120310.135693-1-phucduc.bui@gmail.com> <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
In-Reply-To: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 11:33:05 +0700
X-Gm-Features: AcwNN1Utf0CzSWMalbFPITyh7LOjNeseUmdFJ3DO0v7FQXT2fxbgmZ8RRqPBOlQ
Message-ID: <CAABR9nFqerKXDocMxFfzvvj1-DfyQDvh1z8W81S_Ss4cMok1tA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary, AngeloGioacchino

Thanks to both of you for reviewing the series.

Best regards,
Phuc
