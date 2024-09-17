Received: from sonic303-21.consmr.mail.ne1.yahoo.com (sonic303-21.consmr.mail.ne1.yahoo.com [66.163.188.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D917BA4
	for <linux-sound@vger.kernel.org>; Tue, 17 Sep 2024 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726586468; cv=none; b=lU+pz9DP8LIh2h25Nd2Z+cEih03EEVh1JsOCqT5L7+eA5O1HDbOo/OIQFLmtUWiC5kHzxYtiaSdHEbAMjxdgBuoG9v5AS3EDXL07eVb20oT8B2MNJTS6irlHgeaxxByBDlQK2qsGo4vJXfKe3gLgGB8oDjBLzMavlJuCPM8+0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726586468; c=relaxed/simple;
	bh=eCoDnNuZeA9bjiLBaW1M4ow37W8wySfM27DoxikpqZg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRR4cLLs5dZVf6m3SudydLNkn7XPH9jHhT1EIoD3dRgT8PeupwWebHrdoC/oDgAXN+t/twuwP8+vVEDB5TDWdE154+T4XYg0Kv7leDR/4BkxRfFEsmsyB/Lc1MHo4WJlRQAyUwJUEJCL2j5jbtGZFanu09givtYUbA4DVhfJ2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=EoBoBoF4; arc=none smtp.client-ip=66.163.188.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="EoBoBoF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726586459; bh=eCoDnNuZeA9bjiLBaW1M4ow37W8wySfM27DoxikpqZg=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=EoBoBoF4sxHstEhJxXsjoLOaY52B+k7U5bzVEWGSbK5UaUJAjoiXiJq87IgxlvhilZ7Vx0odWuje4JGTXlfPBAWcCDvoFOjdMEiD2NKzJEicMDagNXlQPJXii4aelIqs7PjoHLtQhgdo2dulci2dlBF9/wQ3TlO5k5jqb6zz9D4JT0cMa8BFoM2t8mITkl8IPd0Q2Z4IzfjeBGroWjhdLsGHN6udbossV7QEhy7u9CdPEyYmn2i4NkSn0PPWAIES4afpmMoBUGnx5v/4ignn2wIep9AthllTm9lngrrkhmB4v81X8z7Sf6ZImTQm87FLuz6gw1rlmfzuJNvrIgrI6w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726586459; bh=LCnpRpU7jc/idhnkZZWCRu7F+FPCceNCKs63s1q5EtU=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=BlNJTZvuyZ/lxBybo/jzTYzJTyiXzT5BbibVutHC26fenIawH+bEA6imASxdUjbZFkjL2HKHibu3u2cckx4YCZdDiVPSosdD11yOhYEjUdUaB7uS37UhzNHaTkv2ITLlQ0/PNS2+E6qz28g4BaA0wewc9tZMcGUdgAuS/XAJ1QMDSyTveRg1hzERW/famtjlVf15/dAHWjwBV4IbvRcPhYVeyyK02O/+DLObnG9/R/yGHfuwWIrhihKpD8MBQ2fgFuR+dbttZ694MiKjY3x0Bvw4kWTGB4eCbSLVPFanDtjc+bBEzpjnK6rfYKwFctKKUWN9oDSn4f5sJlePow9m6g==
X-YMail-OSG: wgAlrMIVM1mTToWEXzO_RxAQaBItvg1hPhRvdFl8fuT0M_8KwVB9O6e.gTnnkY_
 5EBmas4f3AiehKMiyS_zV8a0dU7Jul.89Fz_.HmZdXemaExAWnsYTsUB2Tw6UO0thNYAUkfXwk7X
 tAaFIT.dXydVQOR0vFZHrsP4pqOtX9iqfX1YC.iV3koZckTMMXDjf.gWfb6pRidQm3ZFGpYItdXP
 ISY.23NrJM5hKSaIvku3RW3vZj5vfPzVWYMbd0t4L87S0Xsf7XWiinvdOeJwrwiUCoXvOQZClt_Z
 3SV5fLLMKWEj.FdFiYdp7lx1Jhu7FP.g6ZtYsQgYReNoBCrQw0bQ0mWPeurliHLCA13hFTB5ivr3
 qjkLOfhH8D.2GTEc62ZtkkJ50D.9aOzIyJUg6WgfWp4PdXzos3iuLZcX21ojYguUvts9KVuWW81j
 Z6XUCnDXQitrcJEewd1Scbl6mg0J.fE70fuCHYFTPEFgxAdnc_ehTF_IQuX1K7dH7DurrM0J1ryN
 T5lVXhRU6mDvnXe0ChCCyjcjqfe7MU0GX5EzvgHAsGKkVw6Fzal0JvSP58BGgHOVosbqcfIIF6jp
 UWFPjbNmTHtkHQjvHvVH3Ckw5k5WWsewzqSo.tGpOOQ10SzIVVaF1b50vgyI949rUuYbYZrYq6_6
 U1RXLJFvX9q1hcxRkNNsPnlRB9dAxH8M10GyrDT5v0OT1ykA__54Cwmy03sQzxQqHyQ3L.aKuvex
 CC5jYecG5GGnEJIaIUGB4oemAH32y4MZbnRu_CJhw.ejiZfsdBUOudehRxsgcMtICkinaJrCKTYU
 AXbQtwl0KV6gQ6jY5fcy_wZwryHvazMxedDtcbkU9ikuaT6E_ifUeqLDJt5v9bBke3Dx1FPf9jJW
 l4407Q652ePLHCjkCaad6D2GzAfj_HURPYc.83QfHPdvsRFnUOE1e9kNMoWDsgf.z_PLoWPxxDsT
 HYiyab75sPxjJd54BH5zKRVuMGg7oR89geGBhCtlvHZggsWoFRvwqYhtbMPrFL6aXx6lea8emtYT
 3oAJajnibJKm_bS6KyllveW2aNwmCQKb7W607RKIYD7pPtoE7jSilNyoEEiDR21dKs2M7D9YML3t
 bnAVCZF2WMxMA4cSKsXrwpoQlovrBkeyAJOw8I5sCLrSb239gvoVgmjGIbwm6uiVG5RKzUzk99C9
 z6StYtFJxUFzBDlVA5t1G4wnhQcoMi3kCWKOIdnPbtyjCOmUwz1VKcwF_lHboNJqjvHROm5gr.vL
 8SDJWoQwiO8vWq0eReo5gaqN18Yfs3VClesi9.kj55qdQAlOEotiQ8hl4BQ2R3YSnvn3Wclp.I7b
 oAiVDx1Vn9DYp16A0p9rTq1GG5ODCjXCjri0XdvyAaxCpZDFjY_GNexh1fr8aDh.gCgjJ0ATCcjP
 vx.XtHhYjn0QD_iwv4yWaF61iemEaQ3F22GxH4TR44v_acGoYMV8GWecuvve6zHheW0IGjTtzsPP
 .jX91PECLUBO427VcQqXXJ1K1oEHE79F_boSXjsxczgIhpXF0tet6K77G1iQcCyBmjzvyiXCXZ7d
 Wa4Yc5mpdE4iZJvZ7KJ5Jgdghj6_7TD3uWuZaQDNYKgSZrOG95_I24Ql8F1_AXBF3c0UlDdOWNsk
 GV.0052UiVgH5AbIrO2sPPvAOzqKM8Qhpm7wx2xBI..pcVcmp_RUxafkXdeqcdr.hR4s9ocDzouR
 rE6gK4BjIlxCGRUgi0gzpkrtdKfXeX1pL3PmTb3R22CnHHsldd14vN_eXmeFK1y11oSKfDxR9KO_
 oQszTi3iw_8acpFBsTEPu_uN.blRg6ZcWLu0VvPeDZ5d7qMlpcJuaVahSCWktophtLDf7OvayAqu
 .Y4NfBgrB85RYkl14GgGBGpyQs.j3dz6PCuwmoTAEnJNBXjEZD9520m1XT5hTIrtGKILeTeOoQY1
 ApQcmWvs34xW8mkQdQ_GYWbxmRXDo32uAv9OhhCXqj_PCTBJ5GC5Y8j249.RBU2DaIby8ExlwUXm
 nshgVn7t48t.epC8eAKwK5HQy_YPGQyXQhmhEAk7DAIznoL3CejHcyPs90EYW8FXRJ0uPKi.HGgh
 PbwSvhQEtUFLEuu_P9IQy7aAOFghRWlLBrmHJXrLVoUo2oeTsKAArZDOviLrws6W7.0y_EGBLAHb
 LWNVdehJLWq7WBhDKDpSC6hkAva0a0jOZP3Q3wmF1SgfMmZJxnfh3iBmceLRHAlKezNrEkMELV12
 KpU1MLDQNIvfAP0jiP3LUYGGjG2XRrpnOI1T3cs.jfu2ecxWEKlmIJ98RlJWcPofIFzogP5eRjSq
 Ju7WADEAkkz3o541xmQ--
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: c3b24f41-9e4a-44b5-a7b2-8c535e4adafa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Sep 2024 15:20:59 +0000
Received: by hermes--production-bf1-774ddfff8-x2kds (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2cce89a83e2be9ade0c92c318e2f1c91;
          Tue, 17 Sep 2024 15:10:47 +0000 (UTC)
Message-ID: <7641ec2735ee905f281cbf89aa496404b752565b.camel@yahoo.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
From: David Lawrence Glanzman <davidglanzman@yahoo.com>
To: Mark Brown <broonie@kernel.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Date: Tue, 17 Sep 2024 11:10:45 -0400
In-Reply-To: <ZulFn0Vbz9XUHA-r@finisterre.sirena.org.uk>
References: <229243264.8919425.1726551100908.ref@mail.yahoo.com>
	 <229243264.8919425.1726551100908@mail.yahoo.com>
	 <ZulFn0Vbz9XUHA-r@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.22645 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Tue, 2024-09-17 at 11:02 +0200, Mark Brown wrote:
> On Tue, Sep 17, 2024 at 05:31:40AM +0000, David Glanzman wrote:
> >=20
> > Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop
>=20
> This doesn't apply, it looks like you've had spaces converted into
> tabs.
>=20

My apologies, I'll make a second attempt. I think my email client
converted tabs to spaces; assuming it needs to be tabs based on what I
cloned from git.kernel.org. Let me know if that's not right.
