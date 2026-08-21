Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E239DBC5;
	Fri, 21 Aug 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316286; cv=none; b=FYY0CYRc5OAJsjLOIGaOexwouM+s44TIHSMqdsFJR2HyYNVU3T5Q+8ug5nJ00+Mo9Ux3BikKRcOqAq85YqkhEAKGBWvChCydE9voQG1d3/x1/2Ox3zT80qC/cdBkwcJHKRrR9Wt7yEx/rKT07//D72nGGbZHnI/peY2GyZ7vP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316286; c=relaxed/simple;
	bh=nSzI02SqYCrO7TDud7QAUZzJeSrYnq6okKutw9fg0Xk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JuOC7nvwMlB76b9tLeBrFNq/8vRZht6SP/pg31t8UQa6tBWTq32nxug1TZD3QrB3apPFt9V9Dwp7nZ3KFUBtEZ4z2fNld4JXJcTJVTsDg4e8UmDF3ce/PXvY+SdLikB2NKmJSlWwWuYsEXYVv+uRf9UwXN6m4r1ozrNlg6SFmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MeOq7qNV; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MeOq7qNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787316269; x=1787921069; i=markus.elfring@web.de;
	bh=geNL35FhAJyxVHiZrPoQb+gq0vpgjEQUyEBLYbI84IU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MeOq7qNVU5MTVY7LncBiLRnAqRAA/KUIIXwB5dfZ61Btk8bjLqR6CrgXJNfuxTq+
	 NQzNNw4eFo052Eeo062Nr1X+ezjNsAo9/7vmMIurZoN4eFNjRmLkjAf5ata9ZnDH4
	 EtD0qDxXQK4AiEd0rBD3AQaCGbjgGJ2aEfUbSBJkvcMPyk5EV/sDUTNkZtuXvLYBi
	 1f5Yff9zomtgikIRAr9raNyByeFjF09JCDlZLIu+0kpUpFC5eOLS+i2iSPt/dUJ2N
	 5KlBQo/vS61j/KlEKKMdil9IXN7h9GM5X42SLIP/TLSrKJmP9hD2SsBhaY5G1qGd5
	 OsMrbWEQZxwRAxWnFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMp8Y-1xG1xB01Y4-00M8q6; Fri, 21
 Aug 2026 14:44:29 +0200
Message-ID: <28d740fd-ecf3-4d10-8d8b-7c4851709631@web.de>
Date: Fri, 21 Aug 2026 14:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Subject: Re: [RFC PATCH] ALSA: pci: add PreSonus Quantum PCI driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T1lJN9not0DNdryyKdR7VXbvkYEah/wgGQl6nvofbSm41S0kPp3
 94gWR5g60FKfQeCm9Gg2e8axhVANBLveK1Y++wqZDq9CzYeH2shzUhY3fNnp1FvGmzfYiaL
 sNh8GELpzbQKAA3Wqsw2ywUhTMzmbGKYgtB4nmc8fADBpJMHVOiEPf6N0JUcGXY8NpPXwed
 1ylJepnC9XeCCkqnCrH5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rfyKUZjm/tI=;YK/iSZvYOIUMvDrvBhaYSUDH21B
 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

=E2=80=A6
> +++ b/sound/pci/quantum/quantum_dma.c
> @@ -0,0 +1,853 @@
=E2=80=A6
> +static ssize_t cpu_latency_us_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
=E2=80=A6
> +	mutex_lock(&chip->dma_mutex);
> +	chip->cpu_latency_us =3D value;
> +	if (READ_ONCE(chip->stream_active))
> +		quantum_cpu_latency_qos_apply(chip);
> +	mutex_unlock(&chip->dma_mutex);
> +
> +	return count;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&chip->dma_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253

Regards,
Markus
