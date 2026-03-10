Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F73B19A6;
	Tue, 10 Mar 2026 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144689; cv=none; b=bsSdogZr1GcbZV0ihBR6QX3EmYL247tlay21ccfIaOhCo5s70ALx9enid+AWlKsIH0RgK+PDe23C1qNboko5Zb2mCYCAR9dRQPxvfY4rMroWT51swf3y3xJTk2uuMKkIUqvIJr6CWzUHZkxfI3xLixBo0A82asFjwmbUgk9wT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144689; c=relaxed/simple;
	bh=s8FKFgdmWzbqAD+aJQzxRW9P8jZ9PHGe50Fktd3dCZk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ZcnyiJiy/m2++lbqEYVMPUVDKa/NNcPN6OgEHfJsJsJpq2ksng1F/ago0ZCMettcY/LQbVmSNCJjDnh0KmW7ngDA5bdcxGgvy66lYNjaSP84CJT5Q+F3RnyjdfXfQEmGdA4AriN6KhQmnpbc5OaZROtf7d1QAQO+cyvFVWZEOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QEoRHBTU; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QEoRHBTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773144685; x=1773749485; i=markus.elfring@web.de;
	bh=s8FKFgdmWzbqAD+aJQzxRW9P8jZ9PHGe50Fktd3dCZk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QEoRHBTUioOUZJ7jBotorMiLa83xtpR2Y/V0MU9RnoX2fnmiCvUNApA8aKE6CGUs
	 DWX/RUgsGniEGLGnYz8n817Jq9A+zGLlsn9YMKwkg9bpoL0R4ya+A8TBVAwReVdTZ
	 FzmEzbu8RxYYD4ey79QDA0nY/5Hw0piugo5ueW2a+DPCstBE4UXYscQNciGR9Loye
	 QyG2kWMHvsNWs5/KGcNCN2LTXlkuKAZ5tmcgfkrAAoDyuE6l173pMQmMsXcXUBJuc
	 w7xgfaCX4wXn5Y4YVP+eU++a7YIdD6jvlsXw7wPnkF+XHTAT7A3VmS9jHsj36Li5V
	 FhlB+OwioUGbN1eVZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMp8K-1wIhiH1Zum-00WqNZ; Tue, 10
 Mar 2026 13:05:37 +0100
Message-ID: <310708bd-dd61-4bdc-8e7b-ab9b095b6b8c@web.de>
Date: Tue, 10 Mar 2026 13:05:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Akshu Agrawal
 <akshu.agrawal@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20260310024246.2153827-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Add missing error check
 for clock acquisition
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260310024246.2153827-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MTJwsA1T50ZTuFyHNmHS7SovVX0s6AN+GXLJggvnnS82O2Uog1p
 jaBJylfp7wLuR/gsu2mCrlH84+15TpEb6dzsXzCNQKAywurhMKxyDBqL3dF4TX8uW9KwY2k
 fq4hyFoOVAlcDqXN+lBSO50SObDsHM7Xx3i65ocK/oqopr5klaxzol0gNtRxdNEVWNbgPCO
 WP2ZAl2KrsHtsazmkq6cA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zk02R0rBRHo=;CHWsUgV9C+ffA0qEGU38Ca9t+iQ
 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

=E2=80=A6
> Fix this by:
> 1. Changing clk_get() to the device-managed devm_clk_get().
> 2. Adding proper IS_ERR() checks for both clock acquisitions.

Do any contributors care any more for further patch requirements?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n94

Regards,
Markus
