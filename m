Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC80741F7F4
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330130; cv=pass; b=oXzufFsMNGuilRBZtquuweVqqrjCQyg8P9oI0GghHwuPZAQvYQG1JxGX6uH1/+MABGDcedpxTsaJXYZdoVVoxi83er6k/ufqy38iO1w9vHkK2hZ4DQND/NFnHDeGYGPU1UjqDB/wH7Vz+kspifAaNq8vAckzlyG2gP1Dpe/RUN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330130; c=relaxed/simple;
	bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2KREB9w7fTadfaBpHlFohQaTYV4P/CUwyK+Igkbqyqc67ZDYlCZmXDh7UbX5yd1NgkgnX7CU7wNWR6zkQcTWtJfXfdxI6vDbPvvYDriHCDP0IUHMtiJPvQEkVOsus7Dpo8B6LbM4MXoHh4skU3+hCQdt44DwJDwuy1bEP/6WQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy8NCSl7; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy8NCSl7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacb8416a1so21559665ad.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 02:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330122; cv=none;
        d=google.com; s=arc-20260327;
        b=o+CCQptKAgJHIkGQ31rtHLEY2fzOpg+1QHJwwk9FwN0DE5ttmLqQHP7KbtyIG6ZMGG
         DVmHfCyr0yO5qaCueJWc/gEE+dCuvDCWLGb/wzeOBmhuFIgQepddYHE5tDSEoIEkXMl9
         RDu4jbLNR4e67ejIW8KzmxD8Bek7olVASjyCwn3SIGwdXZMHSmWNWVcacdI9lPTS+37Y
         HF2sLGRXMdOgjtAKnFV5fT00h6nLnwTdUzJ9vbh7GjUxe+o7aosDN4mIsDIsUoLc/Dyf
         bDDe0c1EwbNQ5aXdiwqyIkvAsJj9f9+Qo4/5m9bzRbP7N4Vi2Dg3Ijph/QdTPnvnQkrp
         2jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        fh=C0/zBzFq2XR1O0Y6ZeI0yuPtP4cGXTr+2EdRDo6NdqY=;
        b=ZGL+cBQ7A5+WYzxS37NOHqwOudI1jK6DJyd1IX6aXuwd2Cfzf+jIK3MhE9luujgSA7
         ulwgLgHq9USIWdRv3VbrruFlRLkJpLjvRc8b4rBQZgzKtZYfE8rwCrwbCQGYSLl1S0gm
         3IHbp3f14ivbWGR8NIVg9og0GH62SKo9mGxLLvEFmSd/m284mo29Rii+s8lC5JkTpKt8
         OGNBs3t45y+4ysm+sSerUUMVHEZYlMMkRHjSI9HCEn7Uaushhq8ZYyCtpo2hVajCMQpt
         C0l/TEMlCqtCnurMag6H6HMl+aoB5kLXDTAtmPsQOC4GP+9ebu38FhI0JyVIQ8Zu1AkC
         hIYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330122; x=1783934922; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=oy8NCSl71vPoekjbhQmBk9ZarsH+c6dh23mE9BT7ctyoRutnizeoyspHmDLw8oFMBL
         kbn3jduKPwAcfLXedWRB7z1exm9K5/+k9M7Yty5dha5XvmrjJxcOAhwl0KWYTF5fdtrS
         f+U2oyUhCAkIaxhp4JoKwVvZJPMkSXx3Kdhv63dtO8py35WHgVqQHeoPfKYHclnbeyAV
         C/mInOsv4xMNR+Duyg7Y9YvLME87am1t23j+qGfjmAvhPJyryeK44xB2Qyf0UyPLYOQ5
         5v8j+D7eMhgu5Lq6H4WpDrZWhQIhxC8fSpIf3wNxs2mTLoiPALVyVPdzvkJTvUmH5F7+
         Taag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330122; x=1783934922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=oYqoyDI2kX3IGk7rcC1Fm13OxZpQMgOsW06L8Oqc/X46YiAkSDMX01OpJE0T9rKdzX
         16hXpASHgA66LUT+GEIQqv2vrvQlJgZn2Fxbj2DzVkoBwYR8A/YZLA+becwMIvsH3tsw
         axzjDPU3fTGocGCgQYRfJO9tmxeaRRlvW9u7iaLMvCRNIaT64enmOtP4Y374h4C3IArg
         NoIEidn+TLdO9OSENW2nVuAAQM5UZNL2CdJRT7vXXneI/4kZ6ycpcbVJ/hVlCzWsqmcf
         ePKpYG4q+e4e7EAXusKrVkXWpqwfeLvNkSgCwbiMByx7kadtinrmwZF6qLwBzxz7N3iN
         LLug==
X-Forwarded-Encrypted: i=1; AHgh+RqM149M5TCk459snyLLgL9VH3W4Av1X7D4H7Il75qCpgXjznafbtPS2WZpXZSPTbFSLhZ7R2/Jtx4CkHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWuyG6I2Qexu2Cxbi3u8+kMzSZI2PrN5OSDkvzvJRMJgZgU6R
	k+jmppEM/YmVLDsqExcGtLEjsWVBd7uoGzqcW8rX0mF0XRP/BzEJD14OzbeHqJfsR4idOcK3wHh
	Q3AeYUvj37kfCPgQhAE0ccRSNKV0TyGA=
X-Gm-Gg: AfdE7ckjTa/OQHLEEVA0ajar9RhvIMTyl8hW3EotY/4J6eFAFd5z4nPF40CQJLlW/qB
	utvYKfL2LkMut+jdkjuv6a/hdQoT2CYfumm60+70l1tJL5jmTk3P16skaNtRZINPsr+6e2fKQAz
	5IevmVWiobVrGWHkj/Ls2v4bV8tgTO6MYzIFUBx0NmYNpAOhAPJQOwANYqyzn/5QzW2dByPFRS0
	04TJx28DA+SnNYN6kMH74ciIdagf2z1pYf3LR4UWh6g8hiyUPjrMmaU5rqgvU14ds7YoeLpfght
	qRyl/UcCv0kiUm4GK5lBCaBjsII=
X-Received: by 2002:a17:903:19c5:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2cb97e575e6mr99029625ad.5.1783330120552; Mon, 06 Jul 2026
 02:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
 <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com> <aktttSJJchwnslLR@opensource.cirrus.com>
In-Reply-To: <aktttSJJchwnslLR@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:28:29 +0700
X-Gm-Features: AVVi8CfzuDybHjqh88A3SxPfhvjmQM4SZYjfBEL0kh9FR0VnJRusuMBj2OSCXJ0
Message-ID: <CAABR9nFpYu8db-FvOB9KZ9XEygYW+Hq=DVLk_LkA8qrcxHyMBw@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review.

>
> Yeah I guess that is probably the best way to go.
>

I've sent a v2 addressing the comments.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
