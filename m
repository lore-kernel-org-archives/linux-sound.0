Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAEB411695;
	Fri, 10 Jul 2026 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682841; cv=none; b=hEw1JhopGEBpZkd1YK7LvObAD0wSiRSApLz/Lw/7D14q3HW2XkIm6XqYb9GbWlzF0NtKFkrR0Fx/lhGn78QiN1BRN99S5jtKLQXlwp92r5vHWpB6zt9/a3xyQ5WFYQFH0nWoszXCoLXVbyl0IDwv5IimWw4gi5BOESCSqj/b/wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682841; c=relaxed/simple;
	bh=53nn7NAUPcU0GEjAet8OUUZf+MhdK1HjkRosJceZ46Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qydv1AlPmY7+Xa7hkr1SPZasrF0jk9G8W69LDH+gwcKOduvssFRLDvUv2jtsx5IA/5rOx/hkCsPWfURk934Tz1XWS1WonJd8hCW4PPXPIHf3QkEseHBad1zqFjx8VjA/iAc7CIpBBdJJX9W9MXcG4xAlW1HJX2CCZ0e1t1AVvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mbFWesRa; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mbFWesRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783682828; x=1784287628; i=markus.elfring@web.de;
	bh=bEH0bTONu1BxWO2vQOoJBgijmxRoZYTwkTORwvC2SaQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mbFWesRaegpSYGsGZK7BoBp+PNOye0yqMPkFUdsVEuPsiJ72wQCw+PrNN8bB7zsC
	 ckke+2WQiP+9lVFsMwRW7wNKNR5Nv49cPMdfutvTk+0mDEnkLDyjXK/oxZXJFgmvV
	 xgt6L0ce5Ik3UcR27vcpQyAx02tGvqlzVdzUTbOGko5jNc9OIMHr1tS5xUJqhM1MC
	 IFWvDMpVDscPS9eh98gOc8tfEl+Wo2WdrCX/Zmx7LUQN5TGcHLehTfh7reeTS7e46
	 rLq2cKnTP1ylqmFSvVMiWR+pInU6On90Ip7+KdglOAiGoW2labr0fIHmjif3jBwQR
	 7jbcNNYaXC6QOcGGyg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2BMA-1xCEIX3rg6-01694H; Fri, 10
 Jul 2026 13:27:07 +0200
Message-ID: <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
Date: Fri, 10 Jul 2026 13:27:04 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Valerio Setti <vsetti@baylibre.com>,
 Ethan Tidmore <ethantidmore06@gmail.com>, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
References: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZdeQDG2m0MdsFVLdGtldEqS93FL+zTFMqxNSx6yQpU7JwnCUb1G
 l8+yupHxG1RYG5csV5wnaqDHKtayvaqzFznBRAIil95nKEPqZDmmMSWzJnYBAnIe9yWmy6C
 v0/fhu+jQU0ptDqh0czAgmh6MZ3pK1pfXtY7d2LV1CeBpuLp4GXnNGaeiIlep1AtrzMxO1K
 CCqZ57PZ8RnQfElPUZx1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QR9rBkJ78GE=;nDrkwIBqUyqWJi9FkW1804U/EQ5
 BwIi7V7/EyHqWdRchymQU2UdpVHmqYnBy08PiS2H9lLQ1OWGSA+sJrFx/Nk3S8grfpIBQGCfa
 YyN6w6DUZ8UIu6T8gV9FfwWNG+cxHIwN7LaXNDDCF718UlRSWYR80Z2z1Z+f+KA97XrN4Ob59
 EGO7pQ+e4WMZF6NSgzQsrIIC6PRHeYVdACjv7aXRD2vVbBjuYoeUPKcvhpYHB1ZfirSInikj7
 6ipZ1rDnnBrrCP4X488FezKRZQ65hKMWnvEWlt5mQ/2ubQylJHA0WD9r9pbDhWKd3c8vRMHup
 bC1dMfdZmcKi1OqBQdmfL+rHMajVsElXSmHECJPwwHXlf9rTpfDbhdaqTpAiVGROwjCnf7cIP
 UoSZsPh6E/kYQOu9a8l869mh66o6YTWyJx8/MYkjdCkbZcrjeXssbwwDZHxWaXxalwEga3RS2
 xg8HzSDhi4IU2pDAhEzTYdf2dD9BJErWbXFQGAiJjpxJDxSD+Fv8//PLkOsHJHuOB8atujCPj
 edMq6m3PdEBiAa0SFhQqtwiYYhfeyyKgFFjipxiX8syGiKwvSJR2kqdAPk+zgN36PqzydXrx8
 6cGrd4hr6Ae87uR7zAqr2ytXaQVI3qMAmISO24Ti+lASeJu6gu+DD3uhQZdZA8ZPWsJkMDOj2
 LkPa/Cgq8z3v4DU5FAXYS+woXZQAI9LMFiN6DPcOU+R5jEaeQT6OtSdbBa+Z2IBNq43jrXAib
 QEx6ktqTt3nXk7VDz9NdEs0Gp1jZAhfAmAMy55FnwMF7vMPIixKKHVwiphXGAsLTzhgz7Zx4u
 Vmb+/JHZaxzLOzGPo69Y0ZetZgbtbxrhBiDoHKD/P4wNXg+R3XYaoqJ2KNBcix4AzppQ8UAlO
 H/z0u1tP5YIKR6C/TaJhj5IpMvpFZd405dEBFNJxbrsTjkP0BmA2uhH/ymFj9gsxj+7PiU14L
 pHIb6FqY11h3wC+5VcVJiQlh43KJ0WbehUjuyTRt2JCKdqVAhCwf39fH3w52QWbSUTq0XYE1T
 JgCO4sJSHKel+PenoL069H6mxeI9KURfUpgzdQShOGvHv4gWj06BhvpOS85V76IGRs38vsiEe
 +skTY3XJD5C2wuF5lSCCMlE87x7YN7fVVHDNKKNT1gP0G3CPCLwak7Awlk+2lya8W0tQoDSNP
 CAHXd6r6wE1gKaz+q6wlMCx+I7zaCTyirgQE1Km7Izyp4J3uQEaSSC2e+iSgwHIpyPiMQqZK1
 NLad9JSnuDOilyaX6nZ+CgBjwKDkc4gMp2g+EaPe/rATSM5OJjhZF1OwN+pgEchjb8LD0Jd6v
 OrPcKAkAsmqAwZjH7TN0/XA2Jir8mSdaKlO3X/N2l+q8hI+iMMHRGHIdyakNHOzuqisu4keSa
 yxGHmJjsVg6mtYMNg0rqEsQmQRL6TKoWZ+rt/R+/9vF57JieS8bnanB20s13fxppw8elLCOrr
 YRU4Gem/sT+MkWNSALAV+uSsC0CbWk0A5Z6JnN3OYtZnVRiTtvYOlt56H2HXqf1tHMmHGfXi1
 joq7wmD2+Jg+kuox3ue4lCnTYppw7Ht2ZZSAwSwoZ/Fpkha53ar2dIW9GJ/xzfw3eVwBU8JZR
 BECNX9kq86S99px7k31zrkI9Sh/ZFSznnrngkvl1jO7YAr4Z546r4dPvXx3etwNFxFr2L2sK+
 fHCJscnBHZkAHEak13g8M5xT3dy6FS85VygddUwNfA0qDDYq1Hjxjnb9aoRGefAe9tWKNakKI
 y9mcVoYgC0zdjMuVr18O0BrNnvdnQxlARie3OGZ5GvCx6LrH5b1QhEOEA6rI5cwYXG8UTO068
 RdSht1997qDZD5kbmIGAJwthnCT96B5KqIMfiYp26WMeS3GZz5HVDYcb2h4zCp78UWCGlJDyw
 l2VVofEZRN+gBqeLqgpTKUrSdnhdRkAZzjRPxt+c96Ctae27+Qm9+fHX0diz5t8GeZ6fWf7gd
 JSG/tS8wyPMF2btLnplHpYEgIHyuVyw6S8O7E5OMTzQx3/j6UOw04T6co9aDFi4kctgc4HCUk
 erUWjR0FyZvAROHjYz4mzTrmwCOX+RBADSdfIUbzviw8FZc7IvKSS7QmWS2jACefEcdTKpSsk
 jc3tFHc7tr0QoUT56sFcGWZR+zwXkVGfXhG/C9QqxZ2hwywBXy4567a+0aAOmegsRqV1+fjt2
 hRY/U1G0Wf0zlmAQWRrryskDVv6jDQjoDFqtUAhWrLPTNR6P0eOCLzxR2LGqoGk9byfJlm4Rb
 AECIiiC/oTDgmtEwKYRPjUvT0Bb0DM5htwKdhtVZCKHpoVP7D58J/JsGFTTc7tVc9fXiie2Gi
 rd0kIHPulyV84sG/vd9sSff5g+cUt4BpnJ4RIACFucnFCf1nw8gzEd28iaci59mOHp6qo9w6h
 07mkRyBBWujhCVOUJIxtAIOo8MzPqN+4YAQ4olgdQAQV5KgESmEd7RaYtH7O7nCGSQIQ7N8ZM
 2/x8lkzOadXfVcO+XnKF8I/RdqCUhJ8CfLUZW8n3ncIFsFCDM7rZaZ33dcckoTh1DyBfavxlT
 2Iae9gMua4mCMD01udq94dcIb9wQIzyM/TTonRvBhnD8dDOhGD7v5odbP40TV+Zx3jO/fieq2
 QyoKHK1DF/xQGDQVIamvMAewcqwJXdQ+Y0qLZ0FsfVdmgNM0a4BBM9/hxunYM+fuj9sgnsJOz
 oVEV8Ra8ONpsWjkJ/RF0WnOoj/4t/EeBNdxqroFogvFej2jzL8l0pCBcT8Mu97gcba5H/d8Bl
 gwMa5dCcU8T1eNPqE7oCTS7iiFuQNfubMBzqzwhEULf/f07FGPklfqj3PmOhyrhEgq5BbnbjH
 6ZgfcF9t5hBgjnF7EQWb69tuZE8G8BM2Be1DAvpx8FkjQKEn/J6XExbOoClPD5c7rNf/EhQj/
 twbjWXehr+RAdk2fTQQD5vz/EdKrK1Y5ImjyaRR/SNBzn263Tnat2m7ZAgwN4SvgPWEluc8jL
 6SLLOT5V7p0OQVuu6KIgdk2BaQYBmHwDX87ihEkaueuCKOVDj5mQTw9v0bd2uTgiZg4siPDNz
 qSzjytSYCPp0KEPn0uZOT0x2HPU8LX4HXwkIBL93PZd43NOOyJ6wX830qfX+tkjxxZ9MZfYGK
 SEDCNRTIvL77pjZSnv++ezn5JRIsDJQJmS4J555ohUbyAepgC8bX1DfEf0uvM49CP4i0uUP7w
 gj3FEi/+zRVvXmiggxSPkfShS5K8e+1mQcny3OdC8Vlfm62lF3ZXSHRaoHXRnZLr2rE1CGPg0
 mqkBpVvtdc0Ma0fqpA6/slht6iuRCU6xDkTUmcJo4x1Tt/5XZQX4vwcb1M8dqyHcwNLDHmmrO
 welWZ7jZ6FAhbEGiceeoj6UrA5ypDOAps2xp9ojkU+1/nqXyFP4e6Usf24S9w4t8524Ak+Rhu
 fX0MJgHUQPd/IQMyz5bNLwnwkwQGwFlkKlbiqFUAYLBFMK8oYG2LbyToVbv0gnIVlI2QcDgDP
 m6Hy3eP0hTcZLOKiTuZsMRjY1AZiuVlhljUfhVJ0V53ZKGLD3zOtB9Lq4NEKg0YbEc4hpFDGi
 qQQgU18dwmZXtThkYXRp7bgl5DQOwcHRYJXzRUr2LkZwu148ATj9/pcYnkPGPN7sLBfeGgP1f
 iYsF1CqMJKbO0hoYhVbQ7rp15JUmf57r/JYIbgJXXAY3rZqXfjs8umSWw/gyZDPS+/AT/ApyY
 U7H7vnQ7s0GXNAiTA2QWRDCVKQHA2lpX5/vdlzJVXDcgoOnFJQt7BhGWXsJzGhcJMD0XuJJvb
 S8AlSi3UaM0TS0CDZVIoDe4nSncBoLJubGOzjMlFAruLRh1vGbV8fSrKQVRlrN2CXjzy323t3
 Vj2vkP3oaC86wyM4BDYntN1SsKutYHy0YldSpmdYWbFoFPUwwuRCGPAAvDRd+rMjxCQPQXTwv
 7XPHobNewZ0y/p50OP0mvMCDHhoce4Ck83tZI/6ZRUw6wYznYi2YqJOEk/ZFPm7Arl7mU38uu
 MO1pCrHfNEIxXe5Qcugr7cj8RSyTfiFHV6Up08bHtitZEpKfAgaLl96b4UfnSacXzjcB4D17v
 baMCtWfIIudgICTHWtXU3JsjtdRlWA1puC4cqDR3QXCJgOCWz1ouIPF5m+rB3X6AT3D9h37sW
 MI2jQHM+ZoOKmNuI9cmZ/WA2Qbhih4CT+9Ymx/yDQttkgC2J5oFgmKV2qL0QJjAboFSNy/Lbf
 i56exbTg7Yw4Lf8ks9VPAnJym16aAtntUPhH45MKPCXpxDJFdnlBZbfEUfs+COtfqp1uw461z
 /3KoqLAYLHXyqQr5ByeKSo0eZAN52jIfZUe4vAaL4IBjCscQP1FC96HFpES9Rrmn5619Ea572
 Klmt4fShbiZnmhjGhIPqMI/lACSrg4GQ8mbMRtJt26yFRtgQ7uT7xv9laWPwzMegGw7Ugq1kx
 4EUfX1UNxj+0MYdyxGSeyl6RfwW6BvNQ2ezrDc75uTkhAIWIBdcABA2F+LaKGhqOE/N/gSnbu
 pmF7R2SvxuOj8hSOy706cevzztuuiBckWTtdOzGehCwEFbUI6k8OFCd8Wm3mjd90cgCvW+mzD
 5vIy0mDLs0ZR6JDPjutBktUAOlT0mZy0lheNRPwZl+Vgt055/bew17w5+Gix3T8xMU+prLJim
 z6XcBZ4bJFixQ44bsZpfUxl3Lmlh4a+hCxzHMRPOs/4IAH2pb3RVGfaaXqWEULLjcWbm3gEqG
 B/VrBvbQa/S5dAu4+7oXiEJ4TGxkUhU/c0pdfmqQtxLuhBZHKyGDd1u1/IR++PkBgRVezg65b
 5Tw55svrBjqXslyOvC8GLeLgGg2w7u0XsF1YpGbNwUx1GCPje60oEo+/Zv4eNaNewy4JdMg30
 nW2UUa4RYSbtuQrpQo5EJHA0mcxh1Y2vjkq0qUnI6wASfdQDbf1B/EbiabAhnaaCgdgtATX9K
 iYTGc8j5VI5S05PRs/vb5ZTPbsdv9+JosIuWVOsLD4VgxgJ/VQ6J593p0nUh2g0fY0i4HGPBd
 BephCxOwJ8ulpOpxO0shCKifOiUtHZKpx0Vzb+33dhGs132Gp1pRHVkqOwwLgrcSV7yUAsYji
 P0/2G1UDTn7r6on2lb/hyWmBhcAfLmshZNFQ168zTADCf6yGdghYNgviY8mgXdiA9/Mw9FD/D
 F/vpyYY8A2N4aYT96+g75Sg2cdVz8k+itBVt45VJE7c1eLXzbnKjKLcR2tyu/mO7mfe3PUlNv
 ZE90TCEDdbUGKbJPTbrpc/CWaE/N1ZUsU05u+Xtkpe0IpFp86Tdfx3ZcLvEDZty0KT2unw7RS
 LhTJRzPlA/SJxadU6WyVhOrJRg9gzgXtR80GdX06mMTE2lU41RJf/pYRV0E2wrePk/bOUzj6j
 xrGBzJBxptKwm/RZuLGZsnK13vm7Suew1oqqtfcruNn4FWX4NS4sL+SkJDbbRXDvwurUX9uPe
 o8iya2r0ctyBUSX1OEX7recN1Z78wheucVKXBsNZxQ9NpFsDkSgGjYSLsSz+PdZt5uDL+Bzon
 JHKG4+H/CffYF1II4xq4h5Bm1uSCjMOLXqFzJD5n5VOvZJtBLFhrJmNqHJa568k2Kfult0keR
 BXTcCY39gdHMaFekgNQkK6+MEWJDeHdVfqa1c1pYOpMZ1UZ2V49K3/g/T+X5rr/RPxwtaY39H
 pf5uxkYsItyoPG9uwAC3NzKvanDSsCX2qc3lqluvIo+wan5hgVRHVl1DBI/nO7tE4NwNahz4y
 U7GZKg8nQ=

=E2=80=A6
> > +++ b/sound/soc/meson/aiu.c
> > @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
> >   					 ARRAY_SIZE(aiu_cpu_dai_drv));
> >   	if (ret) {
> >   		dev_err(dev, "Failed to register cpu component\n");
> > -		return ret;
> > +		goto err;
> >   	}
> >  =20
> >   	/* Register the hdmi codec control component */
>=20
> Technically the fix is OK, =E2=80=A6

I doubt it.

How can a snd_soc_unregister_component(dev) call ever fit to a failed
snd_soc_register_component() call (according to the presented suggestion)?
https://elixir.bootlin.com/linux/v7.2-rc1/source/sound/soc/meson/aiu.c#L24=
0-L315

Regards,
Markus
