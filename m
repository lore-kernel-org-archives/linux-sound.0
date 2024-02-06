Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859956B72
	for <linux-sound@vger.kernel.org>; Tue,  6 Feb 2024 02:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707187025; cv=none; b=GBvlEUx2e5mbHFjJu/EnU8tXTX0P7Z/WM/7af/PUp0eQX02OB3CYB3tSxbFWytDK3Pg4VVqHCpPjoSDRgkA8qax/Y0RWyXuEl9VKGMMEtsl00Dy4L+stweaMKO+XYRclNib6j7bryvtbSiaY7/5gpGxk/TG1ym4bgmWfmmRRRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707187025; c=relaxed/simple;
	bh=8Xkka2VFabTnCBLDqMz2cIzHNyFuUmNuTTpO0wkcFSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9WKJr9T5/Dzt+djcveNkmffEY4jbH4DLBZ60SLWIS98WpAHmdjDVMacvuKxayyJtB3Kx0D7qhwKcQfLQAxainTTNR2eUuvURPstlEnc3mAb3l6QWq8kMG7z41Gmu+3haJO9Z8AEKwZxr73enXGMPjMM1VohHzJzpR4raCSs5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9vR9qwV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9vR9qwV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-295c67ab2ccso3780265a91.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Feb 2024 18:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707187023; x=1707791823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7nTHO+j4WJ3VIuZ9aAjBZclH7p87DwAuMSYpHRTHG9Y=;
        b=g9vR9qwVBsGyzuGHY/sGDKUCkL2UPWQO4RkGoWbo6q27FEm6SKWDC6LBuYRelayQnD
         yXJmRUYfbaLTNFPhkbMsq1GtTWIMVVN7jH5ECTp+GCHffP6W6ZMb/Rm7L1MX6xKUCEvz
         zRqwnSAZfm+bYX+agCICGko3aJda8O6j7rAfyEvVmB6y+dl0jO2inM0ggFNE4HeeGP30
         xxbOfXiuqzRLMckN1d0vizWL/tLSxhxrJMFnnVT2ChR66R7QqKSWAYCYBQ6naopnG4K5
         /PHizbHYNnRIYNU5sWLHlSY+7x6NRhG87YvWFR46+rA3Fta8GxG7RxpVQIeZ5GDxY74W
         DLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707187023; x=1707791823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nTHO+j4WJ3VIuZ9aAjBZclH7p87DwAuMSYpHRTHG9Y=;
        b=Q86qWwJD0L4f73MK+dAiLaWKZtSMQW6na0Fql/FndZbEpxfBjnwZ2/mYW3eCob/C4C
         eEh1oU/8owHiU2CN/rNHDpQKtOM+poq0mOWPrsnWoO/QCyzmgFasPxIwDpYNLmPYAC9T
         ku1Vzu324kopN9Y4UdT2yUCE2rPVeTomIBJak9QZPchqnbjv/FoX5QMAElBU9C1uH0RW
         94QVxHcOT29GH4Op9jb0wKqHEMf2q5egarukvU5uxsaCo8GxTq2FWd1SuEIaabMC77lZ
         ZwXAgeSVMdR1cOM1DsYhkFHTHShdMlr/c++kUTUL/2TuU78u7V22uZPtrQgUqAPw4V6r
         5AZQ==
X-Gm-Message-State: AOJu0Ywf5BlCdt1rPSyRdoXaBYipRIJSF2UkbCaQ/aPqHJe3xagFSqtV
	OZbPMCitjuI8auoWfxeD2a/zJw2szXL2i9gG3BOCjMt96IEMGCud
X-Google-Smtp-Source: AGHT+IF4/4hdiG77LysRcru2uTehnOgq23jKGhz0pFEvcQsEZby2Q9cOwE4Gob6D1YF0lKzFrKSyqw==
X-Received: by 2002:a17:90b:3789:b0:296:3a5:6fb8 with SMTP id mz9-20020a17090b378900b0029603a56fb8mr1088310pjb.25.1707187023101;
        Mon, 05 Feb 2024 18:37:03 -0800 (PST)
Received: from geday ([2804:7f2:8006:a4e4:f8a1:8e75:ca57:fd8d])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090a154600b00296c018f070sm244254pja.52.2024.02.05.18.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 18:37:02 -0800 (PST)
Date: Mon, 5 Feb 2024 23:37:12 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: marcel <marcelg@gmx.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] Add Asus VivoBook S 16X to quirks table for acp6x
Message-ID: <ZcGbWHRJ9ewRvAa7@geday>
References: <655fb630-e5a8-4993-8706-085476c7fe2f@gmx.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <655fb630-e5a8-4993-8706-085476c7fe2f@gmx.com>

On Mon, Feb 05, 2024 at 11:48:31AM +0800, marcel wrote:
> This patch enables microphone driver on Asus Vivobook S 16X laptop by 
> adding it to quirks table.
> 
> Signed-off-by: Marcel Geraltowski <marcelg@gmx.com>

Hi Marcel, thanks for the patch.

Remember to add the correct subsystem and driver name just after the
[PATCH v?] subject. While the change in and of itself is OK, you sorted
it, etc., your MUA ate the tab characters and replaced it with spaces.
This is a big no-no.

Also remember to add the maintainers to the Cc:, in this case Jaroslav
Kysela and Takashi Iwai. Failure to do that may result in unnoticed and
thus missing patches.

Thank you,
Geraldo Nascimento
> 
> - - -
> 
> --- sound/sound/soc/amd/yc/acp6x-mach.c.orig    2024-02-05 
> 10:26:11.123897233 +0800
> +++ sound/sound/soc/amd/yc/acp6x-mach.c    2024-02-05 11:04:40.554566909 
> +0800
> @@ -262,6 +262,13 @@ static const struct dmi_system_id yc_acp
>               DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
>           }
>       },
> +        {
> +                .driver_data = &acp6x_card,
> +                .matches = {
> +                        DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER 
> INC."),
> +                        DMI_MATCH(DMI_PRODUCT_NAME, "M5602RA"),
> +                }
> +        },
>       {
>           .driver_data = &acp6x_card,
>           .matches = {
> 
