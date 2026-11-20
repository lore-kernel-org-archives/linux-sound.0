Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.73.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211927;
	b=smfRLtKIv1WEyTyedGoO/556khC07RwwdCAaUH8TCFQjAUmlb1Oc8FOoruDf77ANJOnM
	 h6y4xQ+KLkdMCMPjVCdnyiXSw1tCQT0Zjr0ULlKedA22IHm6rgpW36tegj0qgIt/byCS5
	 pGtH3NEQMn9yHdo9ilPDV8wXdueebrwx950CdZ+V4FITl9j+eUyxnFUja72Ahu9HO7+Tt
	 V/Eo7TAPZZerV+O8tu7fHjNNCs8eAeLA5pCD70MvwBBxaJlEPwRd8yQ/gTbtx0nmQrMU0
	 0m6wRUodVpLu7mEva2s88TBMnEKx2kKm9y1BGHmR6tvFBLL7ZleRpJS2YOn63/V7Pbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211927;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=vO+uPv3zfqiHdkgJ0aAi0xM/4WNzWKzE0aqte+1e/Uw=;
	b=OdS42zq5QnFiJt6oVg86UdrQOsHmO5sB2mWJSA3FKyrYzMQhfYOpiZLLhv8NAJ4I6lzs
	 EuQ1Uk/NC3kTQYjKeJyCQcsvKf3RPuJkRM7UX0uxLrAHysLdPgrSqkqVb+/DJ0B/sME2P
	 rbt1AN2oKY/oLoyy2/tTsCoDlcycyftB59E2ZU5mOJBtaPOMOdfTK3OLrZeIEMN1xEHV3
	 eoOyeRf6lgHHtyLV2Ii6M8KdBph9qPCicRir7acRi3HGq++ytyPUfKSuJVUi7RRIjTjYZ
	 c/UThB7A0exe6KK2uNbWgBBqhJPxtAcNzCYA81ffty2PpJ8ozA8m6YVsDH7emB6l2QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shuye.dev;
	spf=pass smtp.mailfrom=shuye.dev;
	dkim=pass header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=X+lD4E00;
	arc=none smtp.remote-ip=57.103.73.221
Received: from outbound.ms.icloud.com (ms-2001i-snip4-11.eps.apple.com [57.103.73.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3CD606A6A6
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 21:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3CD606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shuye.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shuye.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=X+lD4E00
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-3 (Postfix) with ESMTPS id 98ECE18001D6;
	Fri, 20 Nov 2026 21:58:41 +0000 (UTC)
X-ICL-RepId: 01a1faf8-085a-7231-b2a8-61b24afaaaa0
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shuye.dev; s=sig1; t=1795211924; x=1826747924; bh=vO+uPv3zfqiHdkgJ0aAi0xM/4WNzWKzE0aqte+1e/Uw=; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:x-icloud-hme; b=X+lD4E00ytGPF4WkKU3RnbaxLiSKVT3ZBLzJuZ3tziFzeigrxHN/KA4IxUqjP1s5htKG0TW8mXld/PsZzJzPlS0H5vHdMHqWriiqqkk80EMJpEw2L7cCbZmagOvchgi3jDCyOpVONaU27MqLDQsbOi8TedQa0aqZ5wmTDT9nBjJ2JlAN32P1jfinsHTPBlfPSp7ZM49pLCRRIug60C6kEIQJD/cSesC8hnYBJJo24FYiZeJgEcl1EpsSy/2AMldgigTqaHPl3rwCAzhg4JV9RXcviDdiInnXfzkzHI4jLE56VHmnWgtLK8hfAAfg4P17KXPy06ciTvi1zXHsDnAU5A==
mail-alias-created-date: 1658105457252
Received: from [192.168.1.188] (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-3 (Postfix) with ESMTPSA id 34AA618000E9;
	Fri, 20 Nov 2026 21:58:40 +0000 (UTC)
Message-ID: <1147b1fb-67bd-4e7b-87b6-1ec57987e4cd@shuye.dev>
Date: Fri, 20 Nov 2026 13:58:38 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ye Shu <hello@shuye.dev>
Subject: Re: [PATCH v2] ASoC: tas2781: Skip calibration data for other SPI
 devices
To: Andreas Axelsson <andreas.axelsson@androscientia.com>,
 Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, shenghao-ding@ti.com, kevin-lu@ti.com,
 baojun.xu@ti.com, sen@ti.com, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
Content-Language: en-US
In-Reply-To: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4NyBTYWx0ZWRfX3kPrZfTXqMkN
 xIGpsnkdJb+VchQzCam1iUztQA3GkG2W462dZ7wnlAY5MYVNAmGDo/UUQCOzuLloLsSTiqi1Gng
 2lytNvRf2SodtEHS7Hfg9TB26Vn7/mUWoqqi46pqApiZqNyx4wxhW++H34vzwXw1MqA510oeALr
 CCHY5a+7UGufuw5+iZIPumeE7+64i+KfNTxzGlX2VEWluNALMbqMxZT+nxOuSNIhg2PpayQYw+V
 ObpML34I6bHKiBbsHSf5vUU+ubdLIGEnkUZPu9H7m4FTXJFcu2zY/qr1ODiSbrwh+kCPyjA6Woo
 JZYUM0PoV4OWjhFMe3UsvOth7GwfX+xQl+/3kYwSe37VwFS4DuIxSJkHOpOFFI=
X-Proofpoint-GUID: U7udv1J7ciuooX43dV_1gsDtgddr4q2i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4NyBTYWx0ZWRfX/QFUruMcrhUt
 aoBiwxOt+s1wNHbtyA/5eJWlRX9/i9+UeuPaHF2SPrf8yuu/47bpaKoj4gQoNTAUw6nsKXMvoUe
 K3hwcQVqzLUOgZeVI+fBRm65ti6xSsI=
X-Authority-Info-Out: v=2.4 cv=QK791QLL c=1 sm=1 tr=0 ts=6b00c292
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kibvr5HLtuNvmma_iept:22 a=n4j2meYs4cM6Nswp5Wgl:22
 a=cOokbD2-rtt3SIyQlBoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: U7udv1J7ciuooX43dV_1gsDtgddr4q2i
X-JNJ: AAAAAAABO5gY+IS858yJG5bqqN4Spw336lymq722/BU2B+Kf9dtEYUXGaCnImmjfQJ3erO
 773fvDnF8MqK4xHzqWjxut2llNLFs2CMHeX8mCoqi721FwPMyEIR1ExJZDYxzRd4kL1cFs
 p+lkrrXueNLAjKAK+JWLEgnbHHUbNSTanfxkl3RVUjanpkoI22I4bv+4QLEGJzY8780rZN
 eHveEiLscBD/EcE6sy8yfU8bJ61HdyRGuHC18oewuVDgVBcshs1WapqW9k7REHQE+Hdt0j
 8fQOqaF1Ig2tIpCb9nZxPSYVrj+bRjMx2Oywg9i0ZrA4/urCxXCnapMcti8707wVY1lBan
 qM2SzSfdMUCPUmYFuP1sRcvNJZDqKPdV0C+0xHIGguXBGxj1D4kED8cPjnG5wkMWaF9bvq
 fvamauNKWilXWKLIjaJc1q9dX+ZJtegRRAz0qXTftitt/Ab3yBExWLAmoF7gYIZv9yaa++
 jfyNjGoJ1i+6DjLVtRqZGXt21Z2krsv5njeQ2J2KD6tFFQG0BSPMW/u0J70/WDRBJmPhIO
 baYEQGCLY4tJIpoaXLGLwWjFJAPoAr+rhdnov6tSg0Davrr1802kI1gB4nRSQDreSjGSMw
 ymQpQxRCu8PqDnpNjKoFtiZXjDC95fiDiYHJpjXV6Sn1PVO3eUyyUcG+h/IDI6TWxPqqb/
 U8qNX01C9n+IVhFLMOjeXNx3mp3VgLuj7kjDqnfwaaxRQsE37ylni9DWunWeAOZBLok8gV
 ysCu91RJvP1RiGjdP/f80rFHXQTKZLEErElYnu1aKF6UrTuzZrZkBilCWuwRueJKA7ZarX
 lkcMP7EGohlHVZQBEnc3UHLlMRGawZIyE8UE6MNOmdyrUUcxk0EFBjItIE8JDvLzB4YZMa
 q2NXpnIb8Uv1IMO4gygIj568eQloihfZOXjggsPjGuyeQMcoOkWXb4E5231YdTAme+kNp0
 Z2iq/CCUR5I82ZLFCPog5BcrMekkc1b8I+nNVVvzbnAJBExONWZJ7iB32kn3eeli7RpnDf
 ueJfvhP3DGqo+GmSoXGuHI0EREZP/CvaONeO1FkV5VKzatWzEavYJivC3HtiuFPbexa4a7
 UD3wyGlmRA/rTYLdMC9w2UAotuR9qHRhXBFnF3aLBsVXv5fqn0W9NyfU0DPHmZn056QRCy
 3RH0nQfJ/CcTQX9jh69i6jK852fEY88HECUUEFAgGGmyevJ/resprE0VExaRAhUWRLLCHf
 pYqo4qDfensaWyRJ1rj485NStSEeY77FEKlmu/IGqsNQ41XT3V4Y709H7/j/BNyWEpBTg5
 +yx7i6zfNmflVKIv4=

Hi Andreas and Mark,

I tested this patch on my HP ZBook 8 G2i 14 (subsystem 103C:8ED9), which
also has two SPI TAS2781 amplifiers, running Fedora kernel
7.3.4-300.fc45.x86_64.

Before applying the patch, I observed the same errors (r0_reg bulk_wr
err = -18). They disappeared after applying the change, and both
speakers continue to work.

Tested-by: Ye Shu <hello@shuye.dev>

Also, I noticed that the v2 patch could not be applied due to a
malformed header. Are you planning to resubmit the patch? Or I'd be
happy to do so.

Best,
Ye
