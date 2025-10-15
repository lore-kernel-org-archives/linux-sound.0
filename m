Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FF26E6F3
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503071; cv=none; b=ZV1z222RXSQKQtzhArj9bQGfVLK1CI+8O9ig+DyPBxshEz9RCCoMZaO6iwJSqRH/Xym+Am43uorJgP3+k/yl1WI3aGmqALhPdQkvnchML5mIPH+y/x+Rxl8Ik9G5slgP+bn+OjN4r4U2J/R+T3/7p0xHZmMXcqyGyziN0nubvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503071; c=relaxed/simple;
	bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVkt+Vcv3XaKCTeMVipm8Fk8zQU66PnhhxvqzZj6ge8rvUfnIRqOqSr2U9hyVzdClfWhOyctvDshdzaNm1L5Xnk+vBucLJ5VhRneolciLCPfaTPi78g5w+1t8XCLXJJnk628PdOx1xNvntTgILmPTWpJmMw0KgjaH4nlF0Jq6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao7ZtrMO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao7ZtrMO"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d71bcab6fso55644227b3.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 21:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760503069; x=1761107869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
        b=Ao7ZtrMOo02NAhpQAB9Qjzex6JDj6RuEzRCmXOuLdPrQSZR13DEJU0YIFTuOm4HC3G
         cSXxhKsipAfRDIU72wwskjdBGYRQBSjmAJjApamvcJ0PM762A8HJOh6DmYyikZbfw+FE
         JemB/iTM8Fh6sfODM5ZtrwEbACsPiex3ZGcv9JLyA4DP+RVvIHFu/UyfHxhf47GnfNBW
         mR90psZxn8FHBR5seJ3V1WGKycekFscMw85ha9cqUSehBWFn73T9T+vSJPnjFzss2Oy/
         srDOOwQybr0uaC/LDJwQqjPIMpzeGTbg9VBUW2k8TCcOcsO8OXaBmeUWHoxnnxJ02+Dj
         qGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503069; x=1761107869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
        b=jBvjtAK8158yRh5ckBcEXs0H54vv66BKliHojJEaCc+h09BU001q/cItbzkN0p7HFe
         AIOmX/XgPhUZRksGTS8WnylAPGbk8APi4/yNs9yB/xotr494g9UAijPppopqfqpeI51h
         5sW34TnQvBjEfEsrwx5/ufJQdDXbM8WIMJfpfB2tnrfjbq6RynpfQ2/NS0bH9NHIawYS
         LunJa9iS2yK7XIYhQq4Jt/ilzid63Qz3syfC7xs2YxcAxvoci8zf6IA8hl8ytD/nybsP
         vLALk15gimrwX91CHGahXh2ePIk11kuLp3jcW1ukcgYG6VbubYffpbM7qyS5k29WftE+
         ps8A==
X-Forwarded-Encrypted: i=1; AJvYcCV70kAto83ZzTIz2AKaS7dIA73StHEReR4ryvRCMf3tCvQYTnHRtG+jlClU5/1J/+YdT0zM+ADfEHLRkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNYXXXvSw3uz9wDPjYbYM3SGcxTs6Old2XpuApFjJOm4mKUzor
	zpe1BxUC23TrVOTKI4pJ11/fOEarNpT4sgCKc4Pf07xA5nguwQ6cHEDxtT2tzYxI9iDeki1IU5Z
	aZq8MhFScalmcw5jCjGf3bCrrPrqN+9k=
X-Gm-Gg: ASbGncu2oeuXNQPp+XrNHBaJiZYOxpV9edzQ8/pGvNe2Cl9GaeqRd0qtf7qWWpy9DRd
	bdCtIO3lV7XD57Ckr5ps3tbXlRbNbiwxctKHq7+SVcQ8fE3/QCDUDnDjHHRWPS3TDzg3a4b8myK
	9AfxlZ7Oufk55k2jFvaMNp5jtLAtozNLjfzj1fYFUCf6sXcOUgv++Ii0evumx2004sN7QYzZsss
	dzp+fsbjr6qKmuEaXBd7SZP3LrBFA==
X-Google-Smtp-Source: AGHT+IFGTphc3y11MB/LxyjmRa+A++DJ0JzpQeR4zZW+As7fGgAafakNDnSFAXBdte2IbD/92CmJji+KpScnDU6qqV0=
X-Received: by 2002:a53:ba50:0:b0:615:620d:6a52 with SMTP id
 956f58d0204a3-63ccb932bffmr17205947d50.35.1760503068926; Tue, 14 Oct 2025
 21:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160434.1859-6-tiwai@suse.de> <20251014034156.4480-1-safinaskar@gmail.com>
 <875xci81dt.wl-tiwai@suse.de>
In-Reply-To: <875xci81dt.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 07:37:13 +0300
X-Gm-Features: AS18NWC0RovV7keECU9wFyrJog3woEwrMZoFAlIQ36YocePVNhOZmghPOlc0z-s
Message-ID: <CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: amadeuszx.slawinski@linux.intel.com, baojun.xu@ti.com, 
	bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	rf@opensource.cirrus.com, regressions@lists.linux.dev, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:04=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
> The oft-seen "regression" reports for 6.17 were rather the incorrect

My config indeed didn't have CONFIG_SND_HDA_CODEC_REALTEK.

I set it to "m" and did test again.
And audio still doesn't work.

My new test was on v6.18-rc1. Here is my new config:
https://zerobin.net/?93d5992bfc6b71fb#t3wlNqOtO4CA68ixHQA5+20xXFAh009/I0d4S=
lIpS9A=3D

--=20
Askar Safin
