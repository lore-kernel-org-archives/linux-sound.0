Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB13CF699
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875687; cv=pass; b=tZDP74QJr+aZXHdOVp2PucX0cKUTbiV5Jgsrq916xH6vHqmT/RYDZH07ehxl/GBdwRb/054qASSfnk66R9EtdsOcaTrQW3w/kh7GuT8VJRlN8QvOD/WEr90IHoEILOO8vXiQefa0l4mtF61vxtXbMNSo6q2J6ft7zDp7pdv8Z9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875687; c=relaxed/simple;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CluVBzHE6beXWFKZnIAXMQlvTEUxeEpd46Gth47QQTSeNiS7XzTdNRxEAOyHkpOx6DhEVLzd/nDnoL5V6Jw4hqTF+P2eW6JDgFG7c4GDWIFXZMeNKBDu0ece8JIXOZ91AKLtfxu5iWtDwHiUB2IMqQwcA+r8i2IpAnXhhLa+bag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM2OZmHe; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM2OZmHe"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8198a3a54d7so4755132a34.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 00:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=F35BxDQ3J3TQLJMAG36JzYhtfb8ayQ5x50HPq39cfAi+xOLWZNC+bdWce0u9urK/zg
         1iXJEvoapJWgLzxXmTtWuD9ij6f0YFDngsX0sHTKUDnOLGDngPz5R4SU9zxRj0MTW8lP
         vUTo0ih+9r9yZGfGMAbMXi2nqkz26k1qaJ3JwW5Zh0OKNuOgp+psQOvLsmc8eP8ENszk
         SUPcfPI3TIfvLQnn0jHRRN6FV6qHBKLGKHJ/8gmyita+67kSBCI7Evhn2GMfkXKII+BQ
         JnS7Zfd0LrHUFdNlKCrybij2ZnPMXyxAudl6V7TVx0DX2pupYJRVdYmSMdkw2HK8wO7h
         b6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=6YB746ZDuQiygui7uD0bNdlc+3g4HFsTUpg/PdyOUPQ=;
        b=dIkKc5o/1KBtsCVPuoohHS384lPmekUuC1nv9tYqfnzAlTRJd9YT0xuwg8bWaW/EHo
         sLDx+J6O1PzKDS9niMkuwpxB3lAC5OPTA6TRC+GT6Ah6qGv7V4bYGz6BUbSErdnFq3E5
         6eRPgIgBxFTlQ8P0Id/SBLe1SYQnO+fOaFtNzaCRiRdDo3TZmuLjntCLDPcBMPp0VBtM
         H6ui5FO+dKPydssa4bLnoYdMQ+TvRzrC6vWI+4lhq2KTN0HfE0GpJwzjr2e1m4PnJXBC
         /7P1/oiqPghp0cWq6zx+wYWzjFnnYTvey/NiCNjw7jsIUFzJK72wpQpUYeUdwOwdWZuD
         EuBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=gM2OZmHeiqL0xiQxjAAqlsAzVMHrKVPK2rU0w4j1ofH6x5oIWWQE/8SdowtSvQE6Cr
         +5Mt/BOyAsGiEwR/zTUHoU9/Hy/JH0TDhQI+X3tlIt3kiZXrfmzT534KWBSZ2hkkN4MU
         klHALIlA0ZemLbRTZlm8Oj891qv8jdwIMvV7ohiniZSrE5TzIOOSnEj7gvaKCpXdzEgs
         lh+wtVbK/RwB03cyoRwNdxMIf261jTq6aQCHBhHLemDPFHkuNpN8e2zlKsinJHJ+Ckvl
         f/9uR+Y3cFBs39F2zA4Jw430o/94XPaVNCZgLMWGkxSHhr9XzFWd/S5xwyVv3nCAGGdQ
         hhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=aaBPpYf+L88Rcy+HZG/l42WScjd9Qrq4nXJA+koGQaQldx7gxpqj/vlK6gLwo4Zd5X
         d+oiha9sANB2ZhYWpvcN2JyKJcm1ZxGL5SlptYI6PTTcu1idj433C/2by+o9Y/85XsGR
         ucJnQII/yajT8EEJ0K+ES75HGW6kC9fWi3Ju9SE0tX+/CkMyObKEBDJAEPqAB3XGpbbw
         KFgKMNvB3071adRvlfrtNQsm+tDq+f7KDJJMflDL5ztVIvrHWOvvGsrGPNC/fR5YXcfl
         CJjl8DCoqAESakcVV+dt/mQw0Czf99QoRlLIVQPpnif/4pyPMTIj/6+sltgTcfqBiGhL
         x5NA==
X-Forwarded-Encrypted: i=1; AKwUvBzp21o9FQfKp2TKyp+76JUle6Tl9WYFc8OJE6PQ0c5MSY479LjWfbMQDXJNyz7KevKLFgT8a16Fs7XIQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLItKn6PbZqIp3bEi1WrefflINkGobuyw/BLC+ETHnOd3zbc3w/
	hWvzMqmZyVEnLanO1ZpxQi27hJPsDyKxuXMgz5wJCWpEMIpyKnZtZNo7X/1oEYAeAFFCXyxnxxz
	Cut8PYeAQYmYDKNvDYAIFFEYRRhvAD+U=
X-Gm-Gg: AYBFou3Xf/r3CBZ5oHtY4/Hg2SPZmUKupQ9jfRluV7x32m6MVgUJ/sjSp7vmceAWXA7
	Z5Cpcq1arpCu65WATfyqKbV4YF5R95KeV/TE5SM8Mec9WosIfWgeUwVHl4+U+sGyRMsg4X/rkKa
	gPn5cHNaG8Xd7pbXLaKNpulGvsyX+XSUeNlBvg6zUuyR/i2Km8RVykeW2gb8e5lLeY1OPeTAF2M
	Rtzea7pH9oSIXxcptrCf5Wu4GirySvJOsooBUlNRcExezpzsDUA2VNScOhCpy8UUjhXpIiAUOcY
	DqrXjD+7tCYNeCfRGusfBEq9C7jve1ZsG2i9g6SglQN4yPomC4tciFHVE9wCMTM/JmivhpQGqsD
	zylc1JMRcLHcm8NydfiQI1a8CRLkyA3AFQAGBih6JFm9eRj6SL2X6S4RFRClelqsz89LqX2Isbq
	gqWfLgdCJcMrMV1zP/Z733p0AO3jLwRIFVijEEl0FwBpByDKt+fQ4=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James
