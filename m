Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304BF3D9DCA;
	Tue, 10 Mar 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146262; cv=none; b=CdyVRs7RFl6MhA9me7tyALg3Er2N87LDVOD68ioUVSobTLYctCgNFIBkl0qImCG8wLd9jiG1ssTjg88c4+xfXNNwcCkxsV16HOjtdSgrphIKPSqQt+/wBr7KoXYIEb01OFaMvdjHJW2l0TtEjnmF1Ni485+YivUqNEORoxms5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146262; c=relaxed/simple;
	bh=sVKX+7/tpaPWY6c7l/Ll1eUytum7Bi3A/KwLe+O8e50=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q9YTPjub5sHgKQg9RaG5sK/sxQND9+FHCg3ZCewm9iJ8+PYAh6YHaJKnN87YoxbsGVNzaupqnkcS8SWDFqaqQrjXDqgseZEQlPgteDOP/XYC4fJr3NHlcffRbgDEsaZmRmzVxQ/ZLMqtgapw+fheK69+dz6Rpb0RCqU2ORhQi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lUuLIbhA; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lUuLIbhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773146220; x=1773751020; i=markus.elfring@web.de;
	bh=sVKX+7/tpaPWY6c7l/Ll1eUytum7Bi3A/KwLe+O8e50=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lUuLIbhAx6mQ+68/oBgDEMkW0QLf54eSKNvU2sK5vYXHjbPq77B0B6I4p+YUQYNz
	 OqUAQQ4+YtZ1+4SHOwpIxUU/azDhiVNCaZbfGywFGrLkRj4V/C4iVcZCnZSeNBOsq
	 dfZC1fpGKl1vcHVjDKwydazIfTsKBxMrVDakjmKVfdI9pmTGQWwgqUbmGOfMFxJxN
	 MSpKVyYoB3EO0vj9wfFdyMYHgudGm9b9C+8a4ZMaZ3YTppVVQgHhl0ZeiM7jBVnfx
	 g7RHbw22YFrIT43YcDPxJeYNitl6CmA4k8X7BcRt3du2Af/etFymKc5LcGGktmFns
	 l3QkVHTlryiRfgOg9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlLE7-1vLhgX2iT7-00qL2R; Tue, 10
 Mar 2026 13:37:00 +0100
Message-ID: <9193e74e-cde4-49b8-860b-17be510e56ab@web.de>
Date: Tue, 10 Mar 2026 13:36:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] ASoC: amd: acp-mach-common: Add missing error check for
 clock acquisition
To: Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20260310044327.2582018-1-nichen@iscas.ac.cn>
Content-Language: en-GB, de-DE
In-Reply-To: <20260310044327.2582018-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:28/GNVO+wr+JR2+NFgQmrta+FyKLH3i/644EoAL+BKHeSoPQXDF
 agTE7I+ePVuC02FtfTWTkO7PwE9pZBr6UPKxHxTDHRqmr68KQfAlyXeultLSlkqWPRd8kK7
 546QDDFc8Z4s5rfngQ+u0ENf1dmeCq7Y+NtBDLhZYvkAAsVXS4ys9l94WaMx7G/MlMVF+in
 36s2hdoXxAzBIDRrKab8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j1mI3XhRiS4=;qyA5WLiWdPzeQOk38i6y9F0aDRO
 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
 ZHrYN5B8=

=E2=80=A6
> Fix this by:
> 1. Changing clk_get() to the device-managed devm_clk_get().
> 2. Adding IS_ERR() checks immediately after each clock acquisition.

Would contributors occasionally like to care more for further patch requir=
ements?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n94

Regards,
Markus
