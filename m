Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D7199EAD
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523812; cv=none; b=MK+o3yXsAFdApai/W80fgvtJa0tiQnVQsVJDwhS5t1QA9V0fqQlA2d2bio6revl9T64+yb//f50O78RhsrTVaLGtMIqTfmKCobSM4jSsN64VyO5ZkIXRgiPrCWvAqB99n6A97e3h4anqMdjLXUbTsVCHDQ1hITEvXchp3lhoYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523812; c=relaxed/simple;
	bh=D5zHzkaUG9quUhFDlcVrJcSL5FWXj5F/tQFVWAqY7/4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S90eUsJ3vGE1GfEKsQk6XE8dYbXeCDZI0A19eHwygrPkMpWsxzaef7fmjjUf4S7ohKXK3SEObSZKBMN93jfa7L6Q67Gii+tO0LXZd67YDUDUznnAfOXp+JWyqFszfMM4hdY/7NOFBHqmePqwsW41L6gbNJ84jgbIUWMikLr0H7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJkh1QKc; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJkh1QKc"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e934c8f9751so1171499276.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755523809; x=1756128609; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hRzn+oIF5fztLdhL5subYQJ3TbdQUTcJRAQuHjESUE=;
        b=DJkh1QKcNrQGf0NhHyIxeAtisT2UYUf/Ft5CEs2QimFK1kLkMzbe3cRLjhIp6vZ9aJ
         T3SxmqEs9se5J1OGeMbv5b86WtfcanrvGrK0mLVfeO6LrnaKxqoK8PLANTzBDwmqpr8x
         rAEAI+VeIg8vuE7Il2hVfJodUxHcrecnYFDM8mpT9rD6NJTWATKY/HQ5ZRJ5ricCiE63
         40+XtyN1O4OOySWYXI+uEx4SeCReohrP+L+BVzWnyPLcLrudE+1z2Y7MAiMQ297D+nJC
         YEpcuemDgFSdjbnzIR4kW7YOIbx1KklRKWWqTtZNy1u1CS23Tlb3Y+102qHufZ/QUEN1
         Dlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523809; x=1756128609;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hRzn+oIF5fztLdhL5subYQJ3TbdQUTcJRAQuHjESUE=;
        b=p03jsvrq9la9/13ns4mbZ8EqsV9ziToP2ootSBrt5Knp94+ULE/w7lQeaZJN5vXE5+
         hIJlw+DkFaKKe7+X08/PXmzM8pjLzCGmb0Np0tf0+MR7yadavfWDxEWSJBngw4U/nKPr
         L/yX09xScOXHwa3ea2synbrDUU2po+FNtU5H/EtxZQo02YKhCqFwNOY01zZb0mqHh4q0
         H2qhJZF8LlmS8ODEget2K2g39KvcywS+grsF8iK7Mrs3Z3kFIY125+B+3RdjfUOWnXJY
         2IJ53VmDuCQXRAVLVBcUZrEzq5cKDIqaWtI7/uYalsCftmT5Lnot4MPr+GbaFtbbWxgt
         kBYA==
X-Gm-Message-State: AOJu0YwiuDKytd4umQnMFK84HKnyPsMl97kqa2d2EiVNNcnUs3vDApKh
	88HYj78uddt4ea0RmwURD0Z3OKj+RHG58qJgj+CVRDV0iEkD+Yodiq4TfrlPfsPHNFEeeL8rDWs
	ARVkBNbdfGj1iIlm1kkY7Sd3gxrZGS7BlWpaUV3I8ZA==
X-Gm-Gg: ASbGncvi0cEork939wdnGJH25R8AlrK9esJ8KEGMFckW1+HfTRCRK+qsoEpZgL8ZJpF
	2cT3EWdF/L5aLltzInjaZR1knQbIsMOcKPWmshQ/f5JG9r4aG33sbl0mDiuUKBO9o0fueQzWC91
	TOLMFit66PGgd9B/XMXJuRqE+t3FpWZexI5yGhuCjsJP/46nKoQ6J1ko75HaXolqrkKLPioiILg
	mJYkvdTgAABTPUzgwb7OmLAFAR1hkjTWGI2LkxAwg==
X-Google-Smtp-Source: AGHT+IEfnxYLmgivZ5x8WDjtZPOjrCQRRZpUr69XKHm0GzOjEcDCv4cMjZWrLbR53neIVMFoyw0EsRuHMA/fjfvtTII=
X-Received: by 2002:a05:6902:120a:b0:e93:48dc:e224 with SMTP id
 3f1490d57ef6-e9348dce45cmr6474953276.4.1755523809094; Mon, 18 Aug 2025
 06:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Carlisle Nightingale <thyriaen@gmail.com>
Date: Mon, 18 Aug 2025 15:29:58 +0200
X-Gm-Features: Ac12FXyAsR9nApNKZs7T3VBCoSf5M9RS6e6ULbN0qOaJbcKC_hyHtiqKe62VaoU
Message-ID: <CAAKYfHCD854_KLNUoe41tC4gYahg70-hzWnb6pKqJreo85DwEw@mail.gmail.com>
Subject: =?UTF-8?Q?=5BPATCH_REQUEST=5D_ESI_Juli=40_eX_=E2=80=93_currently_unsupport?=
	=?UTF-8?Q?ed=2C_manufacturer_info?=
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending with proper subject, sorry for the noise.

Hi all,

I=E2=80=99d like to share some information I received directly from the
manufacturer (ESI) regarding the new sound card Juli@ eX.

The alsa-project pointed me to this mailing list:
https://github.com/alsa-project/alsa-lib/issues/462

Currently the card does not work under Linux, since the kernel driver
would need to fully handle the DAC and ADC control, which has changed
compared to previous models from ESI. The manufacturer has no resources to
provide documentation right now, but shared the following details:

- DAC: ES9080Q (to be replaced by ES9081Q in a later revision =E2=80=93 thi=
s
  will affect driver support)
- ADC: ES9822PRO

Datasheets are available at: https://www.esstech.com

Hopefully this helps as a starting point if the community wants to
work on support for this card.

Kind regards,
Carlisle
