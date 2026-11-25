Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605283;
	b=n3r+LOuJ6Aj7npvDjFquXNnN5iNKJNd79oac3IsEo8fuNV957Rh//oW6ik3L5CsPqn00
	 1vV3wBmKi5NXzY7DVgHUP34JGJdSOk2H2gjv7BGqr/5pUSO7CEeMBubJ3Ira0qPN/yYuR
	 F1qq4evcUaZIPyMazeCcdu2GruFnVz3xCij9FduccllaMejWdqjLcO+uYu397xzJYqVPk
	 Rk2swHbeZz0Bxvm7iC5snXyge7B3+39Ss9iVRToogIsWNNrO1DvlYhoPe6Hsc1cAHNOjR
	 J3KSog1jzk4pwsX2IfCjd19T6U1RrptpsW2L9djLJ0RLOi2L8tLDnzimpQqjdAgHXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
	b=Ctv2TaOxxxlkOnPMsgPiushGipc+dt0rCbxhsC2W73ECEut/YuvKbKcJsSMdKL0wIbEB
	 Z9bPTgIUXyCe+C6ClxmCq/jkpba23eXUK1yOqZpFm5KaM9bpZDXq8eZG6PFTbwC7buqjw
	 BNPX6guYNZpd0sEHGF5mXQXKUDnX4jGTaB5Z+kYWl+DqQOMO0DHhntvu6/1aT6/NkuxSt
	 QKGOYaFj/EAR1uUIHpU46dVHI1MkCQuYpn0xh3atMtl5SZ3W2ZQnpZ06ZgNhH6tciEQkC
	 HYF/HK/cG4MNoOVhqarb7ZWWhtG56RmD2j0b7xFMv0kZXKPjKhkzcm6oDqC1ucBIquA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIAJO7o3;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F2606A327
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413F2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIAJO7o3
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5126505cb3so724242066b.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 03:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605282; x=1796210082; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
        b=lIAJO7o3wJbLhm/w72Q8DztSLynxpak7pj+8/V4bXpgg8ofj4SIw5jR/Yp7gSvkrE1
         h6ftOmUwk2EqE1eiwW8Jk3AymfhZHJehtJSIo/8BXHf5zTpSz5yobRhESj+Xxk4vYPzr
         e7ZdYnD5pb1HhyXgQd7pYNMIq8eJAv/Vw8uSCvGguU98Urnx9Ob3KWVsQyIEkH18lsNs
         PiJ5wQWO2GINSQF6y5KWewYIgYpHZTlNFMeU6HBkulCPFrp0qmnBFs2pdXmt4gBWFxem
         cED6bBqyYk9JWcJcYsl+D3IfZLFe4RBsW5iVqLQD5WAGZxQnsmYva3PHOxb5HS1pBqO3
         7zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605282; x=1796210082;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
        b=DePgRetncdzp7ng7WPC6xvMAq+gI6E0KzBR84D6zbThUNHD02a81zDE7NR1SXflm8u
         2OjkKekPcznPR5/JSLjPyAxlXz1DXQ3kq309YhneMmIx/p0z4GDy+ggrwwJtWWUnzGYg
         N3Um5a73G8Hwi9UPOrYLy8eVivaigBihaTDCB3tnTTCEhjCySCOfEahcHcUAybkIAVeD
         uKjXDtzZVfs7S4jmgp2KWD+A2YwkYrcJ1XAOcWGdhWv44fDUSKN/L9nKY8P2UhpmK4PG
         c5dX63tBLt29WppSsdgv6M7hF5F5XKAZeJh7uYJ6GhCw7V5HVK0nKpLnxM2strdnq5EL
         4mDw==
X-Forwarded-Encrypted: i=1; AL+hErEqlDzBbBHCP+TYEiK3vVWv/1tRnhGCMxy0Kskk76V2rfbTjjTdrNzHblkVHzI5El+xRg/5z0Mn9tWFcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BzVzvmYNxNQCOZLIqfuOCtsQ0SN2Q402su4fiMfJnHWSssFGS
	t1H2YwYy9anv6szKU0A1ALr/UUMmUWJFSWgJwH68kiZCt1XeCq+RwdVJ
X-Gm-Gg: AZFdTZckw4PCyQkZdnLAKSn+IAtZohb2H80d5rIvFKslD8/28/DWmTTowMZcSl2B+JK
	VaVfqEWPjGHOqeWS1j30pIqpiK5Wl8jpP/5wDq/09V84DyFD8UQlSxWT+WQakCFpNjtuh3DYkIE
	P4A7GynpM7x44YPRC4VuaYS1WKtVdX2pzql9tINP6TeuuOiKqKl1F+Y0c4OhsT3kEhhEPqIi5aU
	iRaJsyRkf6XM3L0/lvQBSOU8M2L8Ob/ur8ZVgylNYwDtDMDq7n57Tp95TfJ1jpc5mvWcCW74/tr
	3dqLcbqR0qgghlsIXj+2yyU31ki8wVJQ3KjLcIVKkws4/ZW9dEvfRk+P3pkIF1Lf3L3IClQ1pOV
	yq4Swg0JWhxwrRXRPcAFJvsto+lcluJuiDX72AH5+DlRspktD5cWylJm2VXiRMZxy11TsLGlyxH
	PlVtXzclmclkDroe1Av6DXcWr76G6+H89fgW/9JOY/A6dQLqdtbaXwkuOXvtDk/Ra6JIj9hXhxp
	ws+g/4Xi71zEkaRKk1vSbSPP9vmz7ZXZfADP4np86/PvzfgJPNq59318sah4jgcVkbS7R4dyeTw
	eWKR3hhI58PaP6mFYn+ZlpzCRWvS96UTDH9Wkzna8tOuMntLoZeRlahpcAi8g98ZbCdNYK5nGcp
	ojGcTCOwYnA==
X-Received: by 2002:a17:906:17db:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c513ab404cemr1092017666b.32.1795605281488;
        Wed, 25 Nov 2026 03:14:41 -0800 (PST)
Received: from ?IPV6:2001:818:dc1d:c500:21cd:8ec9:48da:59ee? ([2001:818:dc1d:c500:21cd:8ec9:48da:59ee])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c513afec08asm623083566b.73.2026.11.25.03.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:14:40 -0800 (PST)
Message-ID: <174deb71-d920-4355-827c-73237678b82c@gmail.com>
Date: Wed, 25 Nov 2026 11:14:38 +0000
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
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
To: David Glushkov <david.glushkov@sntiq.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
 <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Language: en-US
From: Diogo Sousa <diogogsousa@gmail.com>
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BUIOuQif0viBBgLE7Wgu5beq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BUIOuQif0viBBgLE7Wgu5beq
Content-Type: multipart/mixed; boundary="------------Kr0y0KJY202boYqvCARElWSq";
 protected-headers="v1"; hp="clear"
Message-ID: <174deb71-d920-4355-827c-73237678b82c@gmail.com>
Date: Wed, 25 Nov 2026 11:14:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
To: David Glushkov <david.glushkov@sntiq.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
 <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Language: en-US
From: Diogo Sousa <diogogsousa@gmail.com>
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <20261110125025.2753861-1-david.glushkov@sntiq.com>

--------------Kr0y0KJY202boYqvCARElWSq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gTWFyaW8sIFZpamVuZGFyLCBCam9ybiwNCg0KZnJpZW5kbHkgcGluZy4gTWFyaW8g
YW5kIFZpamVuZGFyLCBpcyBhbWQgb2sgd2l0aCB3b3JraW5nIGFyb3VuZCB0aGlzDQp3aXRo
IGEgcGNpIHF1aXJrPyBPciB3b3VsZCB5b3UgcmF0aGVyIGZpeCBpdCBpbiB0aGUgYWNwIGRy
aXZlciBvcg0KZmlybXdhcmU/IFRoZSBsYXRlc3QgYXN1cyBhbmQgbXNpIEJJT1MgYXJlIGJv
dGggYWZmZWN0ZWQuIFZpamVuZGFyLCB0aGlzDQpsb29rcyBsaWtlIHRoZSBhY3AvaGQgYXVk
aW8gcG93ZXIgZGVwZW5kZW5jeSB5b3UgZGVzY3JpYmVkIGluDQpkcm0vYW1kIzU1MjkuDQoN
CkJqb3JuLCBpcyB0aGVyZSBhbnl0aGluZyBlbHNlIHlvdSBuZWVkIGZyb20gbWUgZm9yIHRo
aXMgcGF0Y2g/IEl0DQpzdGlsbCBhcHBsaWVzIGNsZWFubHkgdG8gcGNpL25leHQuDQoNClRo
YW5rcywNCkRpb2dvDQoNCg==

--------------Kr0y0KJY202boYqvCARElWSq--

--------------BUIOuQif0viBBgLE7Wgu5beq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE85oHCWXU2i7ehQp93pPwU2yxodUFAmsGwx4FAwAAAAAACgkQ3pPwU2yxodWb
DQ/+IkbkSqeeE8Rp9F+xNfCNMwltb7s+YLccrNd67o32nfPps5MzcrQuqBN18i7Bpg9Nzhnw/5Hc
hXUK3ErBSVtReVTu2EAoc2t9R0kjlWklO/iUhrg8fcELfxlwReljwrRRneBet7XJZOuTsur90Nuc
rljJ4JTDzZENzgk2zntkxxf8p9sXePvJ0VyOdarg1TFSbTYJPsOb242ZrF/g2McQLI8eQD120s70
28t4SDh05y7MpFWoa6cf0oFEQ1MMGnM5u9Gd0weJt5xdGpNAk4ua5thU5WWgfaWCaHAoOz7F+kyx
cOG0mENn4/NQwlNB3neDrJdStTuQiXBNBwMUk78AIO+KlrzivHGwLoE7xF8yCjVIQ/9BiUPAycxi
UJhJxlLEF2YmkAwhxJAjPe+7Bpo9dPTTqzsAGeKOm6u1V1kdHppEgCF2VQfKwNj9/F+fXn+01gvf
TDUZ3jsz/ktRlzrnK2cVNDoDv4HSDCaFMwNeGkKrs3uUgJwbM0s8T3pRaxQOrQqJJD1j0QmY6FeL
js4v3n1cv300iRMo1ciKVaQBGaod3mXUffdNnsIdx3TR5qZxu4pJSK5ewNHnDL0O8+cabyJNg9Xw
zOPla4Y5FDcWohsU7NZOxNr+CQ1Ap1gfppyG9YsLiRN4YsxPCOO7tJBaRl0Ck/IxFl9YPUr5O14T
wJ0=
=haqq
-----END PGP SIGNATURE-----

--------------BUIOuQif0viBBgLE7Wgu5beq--
