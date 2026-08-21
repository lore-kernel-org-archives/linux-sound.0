Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520638AC96;
	Fri, 21 Aug 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787335871; cv=none; b=pip5x+ImD5FecURsXtObLMmxa+53oSnmV4dhmDD6TQZRY5rfkp57lwGFX1XssGv3Lj3GW3tjR8kWu+OZcbgpmfCXkYkoYJWPabZSKqGiw6ImU+ZU6P4jrJpyKqR7QTKnsqpEagonyrJAphII/OfAnOWe9HmArI8XkxmajDxSfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787335871; c=relaxed/simple;
	bh=IuUXQL7nynLlFLw5TlIz04o9Z8KeyHixE4NpUF//0as=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Qt+NVRj924GDLQvV5GcQQWnVYzSXkoPHKqliPbmNkfNs66mPWnG4Co81KtWBi06rviSHPZn5FJsdRRcoYgECVEnMyGmn2OoBEqoHW64Dl0NxMra3cqesKhtCzJWg8EAatOhN63lfBOSfj4lPcr8aBWzAYKEf4SJqdeypfO4wbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dWE2adQc; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dWE2adQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787335867; x=1787940667; i=markus.elfring@web.de;
	bh=cPQ0XY3Ujz4Bg+bQ3BmK1NRgviu3OKZzCC1q+71SwwE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dWE2adQcj2O2M4yEFP4zo83Qw8teLN1gQ5fKpzLNPBEtt+bi5VulDLwMEAR8fSCY
	 QwqNU1yA8pxYdBXVr4JlhoIaFvyNOd4zeXGoDKOVTbvS3gvgmJvSs2Gw7PyBojxCs
	 s8FF4T6NkXfUaSyP0Rs1kPbt5N0o/2+K3T9niH8GgkeYHG2Slz7qSWspIYOByPGny
	 S4BzSBLQ7wp9/fulmFDRuNXHRg5IdgLFVPQhAB9XvsaYL+jl7F3EL4ebjBgg8X6Oz
	 PgUIQpPdbLHC1LNBIx1ivWHBqNO8KxF8u0NmVk8L2hCfSLtDLlk2PUXW+72NHmiGW
	 rM6cbZ1jHCIDjkgmXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9LEU-1wu7d03G3I-00zebH; Fri, 21
 Aug 2026 20:11:06 +0200
Message-ID: <b4e9a02d-4f48-4dd5-a6cc-2f98242151b2@web.de>
Date: Fri, 21 Aug 2026 20:10:55 +0200
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
X-Provags-ID: V03:K1:cSa9XXdg6sZ0qeJOmk0W2CsHnhTcAO7Wh7lqdOn/vQLk4sXpoKO
 sT57QxfZUWBkiFnpgNlulkQ5f0hVE7c3vab4A+Y8WpOWIMdvR7yirhAYDzm5WWDQ8I8v2Eb
 QcYx6V08Ig4ADvKf/FFO99F+p5hUsn0nIYcACtAcdKHSSUjKVZF1+tbZCo+krdM2TH5G7uj
 0rVkiY/IhQNzoIu9S3Apw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a+u1YTOrk1g=;5VuTXb376XJE4hfzpNDdPJIEZ/D
 clClBa3mkzSTEAxnU66jzfkHF1kW6U8NRzdO6b1d1S8fqV83+OXCOK7glQLm9Z4RWvqQxFRkt
 0SWm46g8tuq4E4LGQhnS5BEjHrgvwgcmRejWdEV+Ke8UFUeZVs37gwft1KM6/ix8Q6C0t3+i9
 qP+MOAMkpAhTXjO5laNUumh8lR2pJThwze+5Yh/cn46fHLQrq6i6VW0Pq9y3oEo3oDz1nvZHr
 btyGiXMJJ4Vlp+Gx2ESkg1fUIMNdPuhtd4HoYENeJ6JIh6y7zYwARuc5tyy/XMjWBt/9+pvpi
 sQdjr9qxwbNduSMD3H9cQuGW9tfxdb57gR5HayzA395tDB6EYkAEkWjnPO9WTiUB3L9uv0y9m
 ZpTJa9wBAQYjoiE+tQazK1kKAy5LDok5SMmhV78lFaHuWnUdaA4dpNHemfmzrggBOX9/7T6z5
 XLLCPliFoilzqgCbjUftfCoSkGDE5YzD4tnHvX7wuZAcsSMF+r6Fak3F+TJzOec/fe8k+SuMz
 J8xGKl3QthdcFs2oy9ujZI6JC7LdryySMzTYjnjAJdErevGKtnzeoZZMneeslTOY7NdUCln+L
 CTsZc+MYNY0kAhDhklUJ8D4Nz45+cKLxuCTI9VkKyb7llBu4yC2fubXnq7ujXUZdzqaUu77eJ
 jbkF24J4Vqgu/77ESNlkMmpKl0php0BSq9L64JuyJylVd+QoYvKcWKqKrppRGTBik+BtXAC+5
 U/QuqheeIF9cP4L1rUqr4ZNxfi/m0PjUynIwNhoztgTP64K5XbRg6bfZx8CCB6i/U+vUIhO0w
 SZ+1wys2iV/LzkcYjgkN8lEgl2Rz7c2ZFXj2QSjX5ph0rN4EL13gvXhwlLXcQihXq5sPdq+by
 auFxHB7NpdViBn2XRQH0aE9YpxEsbFpgOgrgfy/iVVicwzAqPKHxZgwSuGPhqPrKJPlzXMX2C
 qi36Prdib4kjBcHldooTkHMDR03pHhbzn0JvdzSOIyEhiBwCTcjWY/MBKEbjbfdCDAzgr3/kV
 JcquK9/rb44UKA9Lc2jtrB1yPz5xwhC6cp6Vu8DWRFhSanZFs7ZnPKyuzFihuctINA8N5qW78
 t6BRov0h2TVkJ2VK219XUNl1XMjsYZR8alvSSWM6Cb78IAYdq4y1jdIJEsZTtnwbp8rGAybwM
 IGOu531yQEExWD7B1im4t+C4G5HGkCx172HT7b5Ua6VrUhA7i4vwW2mIgoBxpExZyLOFzdpOR
 RLkFu1iigeWn4gxvspTM7o+EnXyluYqa/noCrjl1B2G483w1GOC1VeMFeQFZvu+DIS7tZgk3j
 WwZZP1ac467OsfO7wxRBC3B+vAWdh4tYUHkYI1MO3IWvyvf1Q4+vpzle1vC0Loj5QbSe2as/K
 OjcgCcrAVrVTL7aAdvDJBYcPrvFLkH52rNuiXqDZxLtZpUeHLJP4Ybz4zS/tkORpYlMts5Myj
 1b52OrN68Y6gG+9fLeta8WF63xTwflg9cdrtfIHlDjt9Us4pKwNlWmjRyjwhuC6sYwy+R6zwV
 CvfgstvySZZsjI9zfJJgxZlGPJxP1GgoXnSFxzTpLvK/Z/xZuOj0eydEPlL0ug1FyqPRCgCEV
 RIHbX/q83BP/5sFke2y41l7iGNbi3Cplndc6l8CYneckNfJ4bT68f+EBzJn+5VTcOhqIwgHvh
 ynffdAT2gWs71mpi5De5jHiHNcwjRHP0Mum0s+UiAcZiiQkTY+WDRkv5Y/EaG/6octHe1FfUG
 QXo8xkTccdDSeLEp4X1K7kTezyz/DWzJsUBD381AGAyHD5xkg7cb2dQZwfstdBNHNy8jXBd7G
 MUg10HoEqwZzzvGG03q8Xtjh40DI54BM4vJlcYltros+dUvD5UG0rmHPZqq7LucRoE170xPFt
 QJ4ilidxvhu4LCJn0epT0du+ZLsqX87gYlnTOe7URHYKBZximpUIQBb/588xzNuYedppLQXJh
 Bmxc6ErBAFx6rbGwE75zWg3c1kGW0b1V2THkRV1OZXgELoYq3b1DUiuP5oWU/V8pn0LiASAsM
 Ic2bEB48HIun9a7CR74thZToHHLMUq2JtyRmWfhxSWH6kPHAqUBB9Ogwzzp09OOn7ueN4B+qu
 ondsfwNvinTKtaUrL+ApMq/VkhcJy3MHc+w/+DcUiGVdMD1vwKkkic1OMrlHRO3VrFbkvI9Ct
 GERFOafhTmsfPxM/v1x7OkivW5g8hMd/leKTUnbdAwlwMvOmsD98tdLrXhhBq7Jble9X38S6i
 OLsZ4WEwPGdT40KS9b0k3k6BwPjySsoZ7kVoymV5Lt3T34YeIdh7FiF2Cd52/APoyov6sElnr
 7sGvW3ju62+lVvW/xNl3RZdD5J1M6IkkcIobdFjFGC3Vbu/u1rLBR/P+mBkeAS0iM/CsUjNhu
 Zd6WV1dxYt5WQZhZ7cYhopfUIgbiP/K2IahWqqk32H8IanL7Dhp1J8Txg7efOoQMHGcW44fFC
 kH7jR6cmqvmTnd7UgfQW4e+n8syvPhwpcWu/Y97bH3JLdvj8LzfZMoDeN0cptczVj5H/rTr8r
 LsQnox9c5/RLoPRGgdHW2r82NVTV+B4nawgzPh5v8r6ZgS5pI3G7NOfbS4nilJcdsrOOxVgV/
 B1S4ZAbjLTgpbGkuRhlatWjY5fOef26MR/gB0RgF4C05a3XKnEq4sdnR9OPyJpDPuN7LFcbVI
 RaD2K8t9IYTo89QgvTt/8k/ZProDB+l1eoXKGP5CNA7Kvi+5qEBHCqGx9ZCgCtzkyrVwdGoak
 +r1vrde4qu48gJSCJjzReGYIxpmoIGQyQlAsTaNokc0YO99eB6Y60Mnrdf0DuwPNyTun2g75n
 sEIROPZDEEVNzLjmQh8dI0fppxOH6q+MoHs5jdFyFXw8C3blQYd3c0Woui19WxumqznDuvVTB
 1nPlrfnO6oGs/A29E0nsqU3xxqDSaHo9IcbzD3xqI6q390gqU0cjEWM7p6EntkclG8np/2Fq0
 8nmPLzUZY441viHFcnr2tE6D4YsrRtKnaggvPeBXyz5ZvuZdASzGT1FaURDiIHTEm7XAXyKO9
 9z8NejN0YqMN3xRlnt3MKdtzFfALvaFyWbvs9dWW4g36ViIamcZgXJOiYPTOsih0Ld45s5P6A
 GWeH1o5QdGqz/dVt2/XpNyfVR9oAVsgscG3H/eYuYX9kf8FqIHkhvJcpvD73G0/ZohhiD8crm
 JYwXgTBwoVvs1qeGbeVs9ayFvqdbPGV78QoPOD6zrR9yS8f0b1t0rW3BjUr56O0d3uUVECZwv
 JoqnIciN1n6sqKBjUakd7UkR2HS9SF8CWqpFiPwDM5Vel7PwF30ojsiXJxcYDuBRLwu9fzwGz
 6o4qyf7Bt+baYlhcEwds3bvAwBOhO5KTUZDjEDI3rakgHLS+EBsB4tyDCuVh1KHF2Iv31iH7i
 QG/cHz6gMp4u0r1iG3r/8RQjQsP0AalI/Z5YXe/cTcCLuvcxNHYzfXJYHAvhhrNlS+5HcXPIK
 GuHgiOxYAQBtCKTM6HCx6nObE2fhjijD00ibB2h0Ph4tR8zqgqzuKFDJ6zGZiG2IAzXRucslp
 f4nIID9H0FQT/foY4HUYXddlDJ80XUtqeyeqPEYPAib3cirApxdUXrpKnSQbLtfQxYEzbggk0
 omSj8EmjZPxSsbFYAZF9l+1uY/f3JaLdz/FHVYDMsv7HcG/ZtKNCuLwP7R/TjXqZCTzhZHqym
 0FoRbQHtictlKwY1CobmCzFaU2oLQYCDn9Rv3Hps0sCt507u/uCAMcwwZr8zd+5f47mxFvyhi
 7AIei5Cyf3IhuRZilf1g60iztRpVcKUsqsn8emW4V8+EOT9wlG3z7wHCKvhXkudEnx3H1f+KD
 RZsakgp/wnFVVJ5DNT7Z5aekQ3hYSsvKiFZ2hClM3RVrR+a/m/kJRSHvAsF3uLnjg1TI8uxuU
 pj+isr2oxgeGhHmhluRYbSxtbbyNbctypX+FEtXE8Wv09RrjICE1Z+4I5lh5BW9Hi9qNoNEUd
 mjLqB6CnkFe4wk06gwLSTkzEwRR437jaFqNZaorgJcONXbbsbtXa9fdiRUQcEJLAitHySENRi
 0OBjgx+qJErf3eRjo6q8+krJNq+nlm0XYVDcBKnSkBG/m1dVmS4MDbdCCGhDyCRH6lC1+C6Zg
 a+fcVH1A180vvKAHdiN0fiHcn6qSQHfjpvwvRz4lCnY3JJ2M1MvFyGLK+9OXpse8tenADwl4s
 m9Cgi50Jyt9G/c3G9gK9CiprF22rlSKwHCAa476uRBKld33tNsvjtNTpY1pOs5RtRR3vy56W6
 O84nwMLZGY2iHNeyiaN8xvNk7N32RbKYPmTNhYQOL0QhNMIY/eP5fnfXEYT++t4QCNXU5UTiY
 lkyL4vwoOwg8aOJoqFkm4SuPV/92XDj3AMp8hF7TotRTLHh6qC33zOSQKw7nvJLPnK7HmRq0s
 kP11ZT17hUSILOs2O1Xh702vLu+OzoW8Lshspt74AoNwSIbz+9LJuWBVLE8N6ucNn1f8hQ3A4
 03ygbtHIAmTIOMZ+A0Ia5fXDRgHM+6xhYH9jLXhL0MyYFFzoYSnI9hMHeDCV+76+oe5sOrVAk
 xEP8BwA3ud8DJyCjLsjVyx/m8CRvxrdcZWzhZu8dyVg4Qq+16nQHR81N3u9Hjus+yuhXh9MJn
 5TJ5pS0SJsnODYnTG7B0NAr0BR8aLmUX4C34MOdxPmi2FZnrp+juto+PKAl0+HZxRo0ciiUAP
 kGFSyLOORAkkrTWC4DMDGFTaDa6it0LKIT0qadpKk5hJRInM9TCRPJZXRyqcGXeacBw6rOJ+Z
 1TpU0g9JK84xhUxZZu+ofxHutn/E9GwpKCp2XWvl7+kzKi6icVtOTubx9jnUUArA7Ke4yez/i
 s3e3NQj45GFQdbtW94/mMrp1aOam4jXl4VznlRWFSiyN3RR6Pz3yIjoVCFSPL4rd9J26odkyY
 7PwaAJVq5fS8R0YeshyG7WJdGoh7o3yNMGK4C66oLqLBv5/F/+l6bMRg0OijKdLJTqpC4287q
 0yAnqBBFy65F8rDeiSqBIqO9Vnzl8fqX0N1yQSWhqQ2qOv5Pj1EnlfkDF54Z0OAFRTzrb/c82
 VHqdSCaQSPEBt3xC+L9q3FQymwpfCFOTUDBGxv1bANHdz/aYKjPnQ93QAzHwYbBQAmL3Flk+u
 y62fY2+vyxfVX2ntWIoaBFCkWf7b3sNt4FALBiYiBqdSsF86vhUlH/odcSJg8CZjQsqRirc13
 RlU4ZtS0V7JoH2WUEU/CD8QnbBa6CnVtgVl9L4AWZbR3b7DLQb96XZ2f6R6RWcUwp4aHN77XP
 yTOj890icHobAp7X+46/N3pOpBjjVWovRJjHUxcooOYSBerk555WErsajqfn7IE9dIHKs8aN8
 mEx4b4laVFd2JHyFLJBv7nFc/lNC5Qz1uO3J7ZuMbkC7xS5zqA0imf4WNhxALAY9bhate+ToR
 eJN+bVNWIP/bQ3gO3aTBIqTbp61bDarlaWLY3ZmsHEXll76/PWC8B0ARJz9lqybB5uSIL+XHn
 Whwh9G+EZ45Mb7uEMV5aFBSMc8s0Iw9SKYrYhDbU0O9rFoae4L/giSvJSziuYUhX62Fzd6Wr8
 ofro9QQ5mwpLoRb+/OPyFsQUhNdRPyBgx+Q3w/hpRPAdoH15710NxbU8LRRZZAyaL5r6BIY6u
 UY6lqyzCHy4a8znZRc5SxtA0CTMvq/VI+j4X3VF+O8nQXJAG9B7dnDKrSNfZ6Ofur4xi5L+iq
 roJkl+7fxjZ4J9YgR9M5D0sY82esKPEvALgYsfgmNu6SXNwOljRoN9AvZ61kfvd2U8oH6Fce+
 SIf5VOJ0ML2LcsalMgemeG+l9J/4qFvuiP/ggo4yVgoQUI94PYjl2asZsnzyYouKanWoXjzg6
 m/XUloUOxym/P9bj1qm+vYa4OPWsx4HBL1OxWT535t3Irx/wQ5C27yMG8EnOpGZML/jHt1bDU
 +gJOrcyjOYVGgZGVSiJAMgbaZrsXAGtvFa5qOI/O2+XE+lEfKWe+hm1Iq/aF/HhVAxyM3epfX
 rOY6TqiAlPqaH9QVOhr1QsFhK5CirYzPAKdjDsg0UzPArsFpqPDUKnN8xEHyWwoz5Uy9yApTY
 2WlmZDQF9hhvtZgGtAjpX5MttiacfGbcHR9S3JlEbTWETSt+iSj+ZKGWwzhMyINWucaPMCsWo
 MrTIso0qBixWskyKNMSWrJsFfi4qpjfVmc+OaIJbL1zBc+a6knGCEV7IlUGj67e4uVlgLpBbE
 9CMGPk7s0WZ/arvUOmbyxwkywxz4kKpW/wLMjpyZYZw8uv3xeOADpR3Vps/FrKK5q8BvwbKHl
 FWEYv58qEJNemz+K9KmL1ilcSanVaDlyJVEaVvZ2Pla87q1I1oa8ZqJwrnzvrt9hdEQ6ALs6l
 uDpTv3zB8zQqgu0R4YvpgSCbAIVBdKBDz7RFMcz1EB+DFkK8uMeq8MxYKzwELbCNmLAS7EBjF
 /rVfzvJuGfmKVd3TRCuENMsqDAkjP9YXuaIgIfK31mPOpZW1nBLYdh2Hbcfyq9tTUlCyVDPMK
 K8UAMt5PZLESAplU83D+44l83QAP5HP6FGfJkmcHI9JBrIC3WgdcJvMoHdxluOuPmGxCvvE47
 1EwuCANjQ8VpwFde84Bhcb0kOPFbQ=

=E2=80=A6
> +++ b/sound/pci/quantum/quantum_dma.c
> @@ -0,0 +1,853 @@
=E2=80=A6
> +static void quantum_free_stream_pages(struct quantum_chip *chip,
> +				      struct quantum_stream *stream)
> +{
> +	u32 i;

I suggest to move this variable declaration into the subsequent for loop h=
eader.


> +	bool gone =3D pci_dev_is_disconnected(chip->pci);

I suggest to omit this variable definition. The mentioned function call
can be applied directly for a subsequent condition check (like it is also =
performed
in the implementation of the function =E2=80=9Cquantum_free_page_table=E2=
=80=9D).


> +
> +	if (!stream->owns_pages)
> +		goto reset;
=E2=80=A6
> +	if (!gone) {
> +		for (i =3D 0; i < stream->num_pages; i++)
=E2=80=A6


Regards,
Markus
