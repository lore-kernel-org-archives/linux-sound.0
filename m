Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E11F91D6
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754810; cv=pass; b=FPznwlDzUsrEW9XrdLn0irhUpGM1L6UvSIsnQGTsygac6Z+DlPt9W4Hq9B4PQSZg6tKLCafQBlRzGewYccKQAzsFxSpD9G4KvsKo73sBmuhUOjgDLfyFfr5teWyJmVCj7yAtwk5cMwJETQKI8558k75AKOxcImmtN4raveY1arE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754810; c=relaxed/simple;
	bh=9sBAopNIcpvNkr1OzPlCoIXwVJBR3xl+W5LLwDc3cbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAPe9tQWOU660MTdY07pwrrxkcfGUJXSgK/TmyFtey7G0d2O/qAIY50qgKlRIboh+s6Uj1kRdi2avOvLmR7zE4xMA7PgcByQzs/Ww03t1136J25+jZu7Vi259WDIXr5UPgHXYPU3zYJHa1wmKPnlbj2DVBJd7jUE/zBCLcS62Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhvdNfhO; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhvdNfhO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835386ff122so7459139b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 03:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778754809; cv=none;
        d=google.com; s=arc-20240605;
        b=cue5UB1eYNMZw/mrEe4rTW42/rPzJy+YeKofHuuKfxbTstuGQvNsVqfeZqldBo3NDt
         HFMCu9JCYEQf2ymSMV76ASNpl00l+sNdbPpe0ocvcTiBCWWtO4drxUwxXzlO68t5agOz
         vQnEVnNahx2fADcny4ovXpeIx/aZNapxkwEB8q9kOBzL2/JQA44XduUYcrFWSTXgWZrX
         beXmdijGII3hhuzJ8pk09bsw/97QUFB2+k17EpjPXvto2tre3oH4T/0SWb/KTmUhmZUX
         ZpQ3jdDDF5Sap0UcucxMoGZw+/jsaUCv7SguB+4KyOTjeZxgfyI9Vj7NXFUyAqLPqV63
         sMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        fh=EMG1GV19H4V1FR/laop90cRkcvk9FOCMtKm0AMnbU5s=;
        b=T/unZUBJLnH7/oYYMMPanlM5MqivNieBC2vnkQybCQUWc0I3gCFtMxDREMZnSfVR3+
         /WVdSG2tIdz//0O3cpU2Ay3aolbdt87mRHpffcQ3NHGMb9NoNujO4wbUgUp2Z9fJn4gx
         5VVZgap6dmJMitjS5okHtSlDGNHgOYZ/1PRRAzZnRkQO8kMLkyAfBBtsrniePGlXJOzV
         mzfBQDjRAVVhcs3+LSivHYZlVmzLRbHbFk/oQVQvOpZktnsaMid2yMGzoy3Il6DUFtdH
         CwCIWZGCCFbvnP/0wHfHxas2O+zjwupCrvCt0cowGhNgJ4UmmRKvHJ5GcpJo/2a7/VTD
         Jgzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778754809; x=1779359609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        b=LhvdNfhOblOHFNKIkB/WUEfx54GpH8Vl68t2heUZGXxtoCFgkx7M2HXjsemGMJ3Yw9
         zMLY0EK97uaYeRaFWc4pc5e/NfWt6w6t6UcDMggSqcYNJ33+A62AKDfGjh54j9OCKDVX
         Oi15HWcNsF45/ookQtnUi60sAgXY6UYOLpH/v19YwFrFR4B6U18pXoHPaNi2YE21oljz
         mIgDMNmcCS3XQmDtS/WOLF6Y3Xmejf/JpFC3f9XR6M/ZWwypcrTJw4jTcDjxHOZI9eyE
         NQ+cHe0Bx8FI8ZErD2cLgp1t+dBuPwMp/YhpX7wM5AyewE3ncz7RjkOgfHk8vaiCZzdh
         qtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754809; x=1779359609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        b=BUHVfRUHqv9bAB4QzQvrnnsyk3kBc58oTBtYezX1iR2dc73tazJHJDyLOqCcf9HB6t
         TfHJc7YhsD2I26QtJSw57O8dXLx1SGwfz8DoRMnFlsZijF0u0gWe9xOAg4YJ2ksp9Yl0
         SAHtIv+7NOfj3rlt9qmANjtjLV/zpFPNkL/DdGeGP9LfrORgrPhjnMnHAUYVit75abJs
         cPuu3EsYFiMY0YBl3/uTYExqbVIwOBHfWIpsIhaQoPFBUYq1msMaJSsrN4kkxx1cgRT6
         O/nCJYp9Q1a9+n72Z6LOWbqF+PF+ci6clccwNy+x5rhWr05O223Reca2vEfNORkakvov
         81lg==
X-Forwarded-Encrypted: i=1; AFNElJ/LSeLYacH+OzB98OsjsiTY+AEIU1I4Td4HxVpflWmzX+2/BJo4OhLz61XESWjqeuGOQcThJAas8tfJag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzskR3oNCnQXhGh3OnpaavNKIkQbmrn4nHffQ7LCPXXME8+EDZH
	YkpRaR88msNyE38PReR5/x2kQmJzPRfjQb+PRxMxKHvqSfTknOt1VP6nkCdiVMUD6whLYcJIizY
	VLScIh8HKnReBSOZWdF7Bq4ha4INMSqg=
X-Gm-Gg: Acq92OFHkX52P31MMTltjHCELvXEu23Hf1vynoFdDb1HWUGtso6NbGFuv3PLysM9BYs
	FtngZOvmgMDMA3jzIJl8WI4gZF74wZuMIyY/mbXyPkXMl5OeligojyZVGTWIQj6VrPdvZdsux8q
	xErhDhDIlRgrolyEt3P769ruzz2puD+oYaU03VmfQMH7O4KN86J0O117TpwFXGERpKxh7UA+hpO
	XkjUR9K1dFRsvBG+Gj6Qb1QPZMIC2RmShTqvVvgQPF9O4RaPlk8+2eHqeityhPAYiJVxiiZ81bL
	dhC8+qux92Xsoem5F5f7xRq79UPXfrICNYDptw==
X-Received: by 2002:a05:6a00:ad8e:b0:82d:603f:f3a with SMTP id
 d2e1a72fcca58-83f04277f6bmr8500889b3a.24.1778754808499; Thu, 14 May 2026
 03:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
In-Reply-To: <agUknFcDIfwrOCld@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 14 May 2026 17:33:17 +0700
X-Gm-Features: AVHnY4IDc6tthLgrHjXC6SYo89bL-eLMYrCt1lnu5Ycu8ceEQa82GPaz33HiBRo
Message-ID: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, May 14, 2026 at 8:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> How does scoped_guard interact with break statements - does this still
> apply to the switch?  I've not looked at how they're implemented...


I checked the scoped_guard macro implementation...
and You're right the break statement inside scoped_guard only exits
the guard's implicit loop, which is not what I intended.

Since there are no further statements after the switch block in this
function, I will replace the break with return 0 to correctly exit
the function.

I'll send a v2 of the whole series with this fix.
Would that work for you?

Best regard,
Phuc
