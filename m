Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30830FC2E;
	Mon, 27 Apr 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289775; cv=none; b=das/8kLNztcU+rLEMKFTiPIHKh3qFtbDK1AptiAu8IwCrxzgUUkCzfIeLor9SsdvhAXbP9fOVBAo23f8wNn1xREutb1GVNGKEPz6J29ZoEFd/MtqjJC59lb4kOxOKz+DetAuelG0VYHzfBLsHm520V6P0ST65cpyNEh32r4ugUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289775; c=relaxed/simple;
	bh=kkNiEZG80uC1l+lk6GzUTFohCI2Nde8HWbRBj5yeITo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=C9S7HVESrFFVTV6pR6wkSf5LKCY72Iss4hid+z1d9keznS6O6H2/EK0grK7EgJ46jt1tipCrrSvpy7pYLeqWFXQPlJXWvWYZx3H2TvnKXnmOgdQ9WeF4VrfdPsA+nxjKpOEvthzzdUj56rUuEzGqrjvYfyLk2b4MYHkSAVSjDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iwT+1OFC; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iwT+1OFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1777289748; x=1777894548; i=markus.elfring@web.de;
	bh=kkNiEZG80uC1l+lk6GzUTFohCI2Nde8HWbRBj5yeITo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iwT+1OFCHhobjW1Q8H8PXNcgvJteAppl1Np2fGQjZUBOPYJN9bwX0L3YMn8+KnEt
	 5MXmNearySIy7UaeXpP2s815Q+XIU+DbPU5G9DfY4X+lJsA1qguLaqgiB3fA0CDBw
	 hmgE9m0XpzhLo+9Pl9UFlfjvWT2EilTcwKjJgimtPQv9Vq9etendXNoExLrlWuVYu
	 6v44a+ttNeuvnlV/XrUARcS17SbYn4WvdgEKis/mBsCYrAa+gTucguD3I+RlEd4r1
	 jDnZtA8JGS7uYsRotcqhTvhJPN3zmH86WKNi3vMP1SDuFN/mE2aOHJxdePF3or2AQ
	 zwN3D19WEfgt4k8CcQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGxMP-1wC9SR2fuF-003xCy; Mon, 27
 Apr 2026 13:35:48 +0200
Message-ID: <4662b923-d28a-480b-932f-a00e59913b9e@web.de>
Date: Mon, 27 Apr 2026 13:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangdicheng@kylinos.cn, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: wangdich9700@163.com, LKML <linux-kernel@vger.kernel.org>,
 Kees Cook <kees@kernel.org>
References: <20260427070739.133369-1-wangdich9700@163.com>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix missing error check for jack
 detection
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260427070739.133369-1-wangdich9700@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ujeaHkxywkZz2p2B6Sn5JoWGdZx9fV7zPg5dNQ9IO8ERYwLaRma
 x5iXN0fJob3TT3zX04hM/vOuaBaSIdDpqtuKwUCgDuVf/wR6bAVmROhN5+MXOebj1vSPspF
 5Zeu+F9mdFbUU7bQIta3Js322uHWq+NuPzswoxszpSiaUqsURP61ecCf7h1pXfCrL/EieCY
 QQqQAyTV/6CEcB/E6jWOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uX1h4ulHhVY=;eGA4926xLu9oGN8VrtPHEA4YM89
 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

=E2=80=A6
> Check the return value and propagate the error to the probe caller.

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.0#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.0#n34

Regards,
Markus
