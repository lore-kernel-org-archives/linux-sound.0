Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC331B80D;
	Fri, 21 Aug 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319299; cv=none; b=vDaouGHpFzpqf7ERD7+tfR8DP4DcwlUSSsdie5BlzaPoseb3yKfU9owgPPV9ybKZCPNQUfjf6M4l+GX+MONO8CgnK3677PzGENlkx9P1CfPY/V75eOtBpELCOETf58fE+mU+eM0oFM/MXE18BgMAFC/BhiU1objciXCg0bIUTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319299; c=relaxed/simple;
	bh=Otw9Rsr/PSZ0ziqvP5PPPsZJy6oy+0Pys+vMb9T7aso=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ApmHMX6DORARt9D/WcH9WU+JyPZ6QQX51+YP+3wPZPlzNwAHP1XuxIMgtH/JUJl/QOSeQ7iAlaPkgC7pyUaKMEHR9QyCz2eSOB+Bzobevq+lJetKINfNurT+pplSjRn0t2AG7HsGP85ebSuc3DnPVqGFFwgqq9lE3OLEXi6TnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ncv8qTQ+; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ncv8qTQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787319274; x=1787924074; i=markus.elfring@web.de;
	bh=s0MXm3Qm7LS9zDZEJtcT8Am4e84IRmZnb35XivgXt+w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ncv8qTQ+AsR6aefk1lfprEPkewMlwmFEAvaj2AT6XVmMDf28SOX8bRdQG8b1MOIP
	 LqDC6Bz6k4u8aUCFqSsxibx+UJsi4psoEsBbaTgfT3+iFqu5tHsivSDCkifo1XVXT
	 sGJUk+47KYAiXXsL489aNjXP+9sb3++Y2gTypdYs4TorAbMIN2UWUK3dGDp7qoVlz
	 wYLbsHHKp5G8WQSR6WeM/rMJLiDW0P/ksuu3McPEP0V5PxfzJmdLsheMe2frjycfk
	 BgLctuyXUQFr6OKR3ti7kVyhSlPKn2x20vlxcPGgXk536O8O+IwSlHQt1bNyAESVj
	 gc7Rd3HR2i7jHwUnNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdwJY-1wQ0322EQI-00eDh3; Fri, 21
 Aug 2026 15:34:34 +0200
Message-ID: <60400d66-b037-42e3-a10b-88f5efb43356@web.de>
Date: Fri, 21 Aug 2026 15:34:32 +0200
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
Subject: Re: [RFC PATCH 1/1] ALSA: pci: add PreSonus Quantum PCI driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HoofAkxBZESF8zsntCOt13SuvnHFw0urTHtXDMNFXBl9ynJ/Biy
 h3zN0g/eNlD/N+ApvD/ItUYdnAzYk9t6iAKWUqnpcvuwMdBDA15qdT/CXNa4tlcZuvvRERh
 mcPAXx7OmXzzwkIyPZPE4V0V87+FVYNR3aEqzPZ1MicxAqwZ+6azE5rBWsVfA928OnR7uRH
 colqC8xEDU+UuMK4fZYIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HuR3V5I1P9I=;AoIDN58m0sgbSUTwBhi/Ytb2cKX
 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

=E2=80=A6
> +++ b/sound/pci/quantum/quantum.h
> @@ -0,0 +1,394 @@
=E2=80=A6
> +/* TCI protocol definitions */
> +
> +#define TCI_CHAN_CMD_RESP      0x01
> +#define TCI_CHAN_CMD_EVENT     0x02
=E2=80=A6

Do you find the used abbreviation meaningful?
Where is it explained for an evolving programming interface?

Regards,
Markus
