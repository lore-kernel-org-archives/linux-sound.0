Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C771586CF
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922822; cv=none; b=XBAYhlotpQxl3+Vf3yDkBNVRsI2iDbgf0lkIbqV4RNM6oICL7Zlbyooe7KyvFaAO6m5+pCTkuZ3+qrMB2KLekWNf3IGFq2w2q7tVDZVW6blB2wqLJMkdIj7qKc20rNhzTGWIxTu+9vl/iv0XohMnnsovy02VtD+LH6xw9Qi18/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922822; c=relaxed/simple;
	bh=gKvXh/I3PdZE3GR9krNhCfohoX6IveIuFUNNLJAJzdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EsyI4TC7fps8cWTNpJP44ctAR+AvFYQvTW52M/GeDT3avqHejsP0n4Xkz6uE9v/Ho87XrlE+YGWWy4jYaQ4SPQx65Miq4ZXbtUYPb4BeHYpSwFz59A6DDcSPE+vnemRyuPgc0itIGgatnSkD2d5E52yeSKvYy1KVUa3GXvEjGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxIp1gy7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxIp1gy7"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e681ba70so24275e87.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728922817; x=1729527617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKvXh/I3PdZE3GR9krNhCfohoX6IveIuFUNNLJAJzdE=;
        b=KxIp1gy70J57FSxV/5Ju7yRNFsi9uGMqBpizNikBdqrRhST3EfZwjR9tmN/MWBQbtP
         NqfMo2w366X+cTV8HDKetekPPd7VQlLHWBQh+nEHWhJ6fkYrUyLlSPyj5DgR+ql0cX/j
         hRq2rkmbLw8uFpLO8FaqDyirLFqO11o3sNnTwAadOJhY4JRJvibJwErA1xL+XJyzpeU/
         lbKxh6mowvlToN5u1WFhR1IP0nhLWrNxQlwab0vLXeDaUFW6Ne4/RicJgbQ8dTg59kDB
         4x7fgxZRvC2hoQ9Nxou/o7DMYoGXpREUZSla48S8Tq8NcU3kB4z3ZI5KebvGYc3nbNva
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728922817; x=1729527617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKvXh/I3PdZE3GR9krNhCfohoX6IveIuFUNNLJAJzdE=;
        b=e3BKRW2fJFaLy1xsewCvDTBkx8qqmKlnPAGsurUW0xg1HzpgVQCf/9WKtUCR8ZvRoc
         q1My89pjAntqhL1bzDSAlXAfE5bB/ZbRxmXh5MYLx8IXZT8dYLhBlpCpMw2ThaWtXMYD
         vGI0xqoq0brAjj4XMSFbAYL6LzjnRaTF/7144YbVSA3+HvUYwyXGOygQlO273p52eltC
         2q9MOyRTI8rrbJo30kN3AIH6rTd1bDdKPIJBBrFMDqrxOp4aiLm4DzAwthc+AXfRY6Ck
         KOFZpOTGNqKhlQkVtCAQObmuAoqR0aqTqzA3nFkLoLprI3hMBsGvFQimgfRldwheV+9a
         Wijg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtv5pIJLPESMNJLthZlhRRf4AjnUB2don+iba2VA2QdWKqYzghnA1kEspm/EMSsm133DANzavheAn1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17T1kCJZeiZ0MrPIycSs6z1xdAb05olFtDodRHpnCgPWczbjJ
	Ivqq6C87fdlUWE6+u9TVLHpy8hcckYwlqs47kVuWWLv9tYCK/yTEiPBSp7t8Ec55r0Dsn70DTiT
	uCDlv4j5HYBozCergyGD79Ene3tVZSFQC0TZ5
X-Google-Smtp-Source: AGHT+IHzzT5Xql/B/YM8yku8j1FfwE05VlFhBxx9961bqHFWjZxX7Ej6fRWAUlINENXZDwDsDBwPpWmPq5lKA+HjF7E=
X-Received: by 2002:a05:6512:2821:b0:535:3d14:1313 with SMTP id
 2adb3069b0e04-539e5e762e7mr553189e87.0.1728922817154; Mon, 14 Oct 2024
 09:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <afc9fa53-b7f2-45d0-bd30-8681b71beef5@linux.intel.com>
In-Reply-To: <afc9fa53-b7f2-45d0-bd30-8681b71beef5@linux.intel.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 15 Oct 2024 00:19:00 +0800
Message-ID: <CAOuDEK0QomQfXqzmP6g8QRdbE5dXob2cuhM3viErUoDHURaB-Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system sleep
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, yajun.deng@linux.dev, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com, niko.mauno@vaisala.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, tj@kernel.org, 
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com, ricardo@marliere.net, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 9:06=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 14.10.2024 11.50, Guan-Yu Lin wrote:
> > Sharing a USB controller with another entity via xhci-sideband driver
> > creates power management complexities. To prevent the USB controller
> > from being inadvertently deactivated while in use by the other entity, =
a
> > usage-count based mechanism is implemented. This allows the system to
> > manage power effectively, ensuring the controller remains available
> > whenever needed.
>
> I don't think all this is needed to prevent USB controller from being
> deactivated while sideband is in use. The modified audio class driver
> that uses sideband is still bound to a usb interface device, and all
> normal pm reference counting should work.
>
> To me it looks like this code is tricking pm framework into believing
> the usb device and host controller have successfully suspended during
> system suspend when they in reality are fully up and running.
>
> I'm not sure I fully understand the case this series is solving.
>
> Thanks
> Mathias
>

Your understanding is correct; this series aims to keep necessary
devices running while the system is suspended. The goal is to keep USB
transfer available via sideband when the main system is asleep. Since
we're offloading some USB transfers to another audio DSP, the Linux
driver is not involved in queueing transfer TRBs, handling event TRBs,
etc., in some specific "offloaded" USB endpoints. The sideband might
be bound to a USB interface device to prevent the device from going
into runtime suspend, but it seems this doesn't prevent devices from
suspending when the system goes into system-wide suspend. So the main
purpose of this series is to prevent some related devices being
suspended during system suspend.

Regards,
Guan-Yu
