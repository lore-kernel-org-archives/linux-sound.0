Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2371411E0
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868843; cv=none; b=By9gE64NhNLuw/YPZXVsWP+xpMvqOc++ijCH84yd20R57l3DqcISctBYAEIR+D0ZCGlrIYftRNjEx0lLC7zyI1oXf4QSZtJAuCwUe9w75s1yLtQlLhXqtjyVx30OjvAFiEICiLa+EJHbBgoYgM7yBcG3CQvAsw/LUao+73A2kDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868843; c=relaxed/simple;
	bh=Cv9ifMjJi1xPgT32qiX/UlIo+09VYyucwB0zvZrpJsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYd0fb59RDgPCs953NbhIrbVCCuwClv5gO1tp10/ObjoMbsb2Qfg/sPG2nFgQ6rByMjbUBrPB5kvjY0W4Pmv3IgOLm/AjLLZAVBBUKt07S28C+tCAW7sne4b9p61JOUmfzIIKhIaJRfNBOxyMghfcb+Y6J2AgpfQOnuN4sXVaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJ0QxCzM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJ0QxCzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv9ifMjJi1xPgT32qiX/UlIo+09VYyucwB0zvZrpJsI=;
	b=aJ0QxCzMpJqd/2pwfZVJrErDCmIlWqhasyPHCzCaL9mlr0vMcwVerC96tpjWs5d08fOypP
	OH7+dDu9dK4XMLMs/tmfhxQjE3N5EzCE5oVt76ZIE1zfynafs5htsy+/Ffq5vDZNq1rJLB
	I2wQACim268gw/23wQoI2tDBIeBEm9Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-sC0k6siENi-kw9erwp4o4Q-1; Fri, 25 Oct 2024 11:07:19 -0400
X-MC-Unique: sC0k6siENi-kw9erwp4o4Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c95b050667so2161443a12.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 08:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868838; x=1730473638;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cv9ifMjJi1xPgT32qiX/UlIo+09VYyucwB0zvZrpJsI=;
        b=Bb47vRclGZ1Ms/lbNU0GOlRYIF4zBcQU5C9SPFkXmcHMVqBvfE5tApWdkEuXoVLba8
         2q037CfqqKObqLFjWW1TtLPqEcARJxjl6Jc7qigpnaGRljvQejtnTVXF/Gce2hiTqGPw
         UhBh3SdO4qSS84W9UN5ibixRNz6C/EsKbq29veJT8gk+YpSxA50qyidL1kIzLUycv8x5
         060nskQgZEh7RIBsNrm95Qkg8tB5uhv0NMxT6JL5tRZuUyRnZhiDWfFc7j6RffVZ272r
         tEpg1QffEHsW4tReIXUixjV8DiU9STfQAC2r/J3MmUs9AG1zZa1ZMjMh18z+IIXA1pDe
         uVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmod2cObKnZVg33ef3KnzZIh2cwaNpR2+0bt2OwCRX9r5vmbN7XaD9Q0OVNL4mwNOB5Xf1p3gXVyyLJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye4rMBkX8ZdHgMkr4mMyTyzL89b9g1q40rhiE80k1CRDzJKAEe
	IanVDyTlmUEIIfQz3hEN2xTUhFtMQDfLYwic879mKaGeMCsSkBpArz7dWQaAlIWemUZi1VXeO0q
	G6UpbUGn3iiv+w7GH2WDdJt6bZQ58Z/C9SPOFKhVUE/R5Es1oevmvxi0G5/RT
X-Received: by 2002:a05:6402:358b:b0:5c9:7c78:4919 with SMTP id 4fb4d7f45d1cf-5cb8af9c4d3mr8212937a12.30.1729868838318;
        Fri, 25 Oct 2024 08:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7H/bqnsUWHShErolb2XGY4D8jRAcbmNGf/vguZUoOhS98A+ZCyAohXpBvkLBGvNllWPIolQ==
X-Received: by 2002:a05:6402:358b:b0:5c9:7c78:4919 with SMTP id 4fb4d7f45d1cf-5cb8af9c4d3mr8212889a12.30.1729868837816;
        Fri, 25 Oct 2024 08:07:17 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62bf6d9sm712484a12.41.2024.10.25.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:07:17 -0700 (PDT)
Message-ID: <7d2f4230a8113b41eb696564afe8c779aadf12de.camel@redhat.com>
Subject: Re: [PATCH 00/10] Remove pcim_iomap_regions_request_all()
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,  Boris Brezillon
 <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Srujana Challa
 <schalla@marvell.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Serge
 Semin <fancer.lancer@gmail.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Kevin Cernekee <cernekee@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,  Mark Brown <broonie@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Jie Wang <jie.wang@intel.com>, Tero
 Kristo <tero.kristo@linux.intel.com>, Adam Guerin <adam.guerin@intel.com>,
 Shashank Gupta <shashank.gupta@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Nithin Dabilpuram <ndabilpuram@marvell.com>, Johannes Berg
 <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
  Gregory Greenman <gregory.greenman@intel.com>, Benjamin Berg
 <benjamin.berg@intel.com>, Yedidya Benshimol
 <yedidya.ben.shimol@intel.com>, Breno Leitao <leitao@debian.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-ide@vger.kernel.org, qat-linux@intel.com,
 linux-crypto@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Date: Fri, 25 Oct 2024 17:07:14 +0200
In-Reply-To: <20241025145959.185373-1-pstanner@redhat.com>
References: <20241025145959.185373-1-pstanner@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Aaaaaaaaaaaand of course I forgot to mark this series as a Version 5.

I am sorry.

P.


On Fri, 2024-10-25 at 16:59 +0200, Philipp Stanner wrote:
> All Acked-by's are in place now.
>=20
> Changes in v5:
> =C2=A0 - Add Acked-by's from Alexander and Bharat (the latter sent off-
> list,
> =C2=A0=C2=A0=C2=A0 because of some issue with receiving the previous patc=
h sets).
>=20
> Changes in v4:
> =C2=A0 - Add Acked-by's from Giovanni and Kalle.
>=20
> Changes in v3:
> =C2=A0 - Add missing full stops to commit messages (Andy).
>=20
> Changes in v2:
> =C2=A0 - Fix a bug in patch =E2=84=964 ("crypto: marvell ...") where an e=
rror code
> =C2=A0=C2=A0=C2=A0 was not set before printing it. (Me)
> =C2=A0 - Apply Damien's Reviewed- / Acked-by to patches 1, 2 and 10.
> (Damien)
> =C2=A0 - Apply Serge's Acked-by to patch =E2=84=967. (Serge)
> =C2=A0 - Apply Jiri's Reviewed-by to patch =E2=84=968. (Jiri)
> =C2=A0 - Apply Takashi Iwai's Reviewed-by to patch =E2=84=969. (Takashi)
>=20
>=20
> Hi all,
>=20
> the PCI subsystem is currently working on cleaning up its devres API.
> To
> do so, a few functions will be replaced with better alternatives.
>=20
> This series removes pcim_iomap_regions_request_all(), which has been
> deprecated already, and accordingly replaces the calls to
> pcim_iomap_table() (which were only necessary because of
> pcim_iomap_regions_request_all() in the first place) with calls to
> pcim_iomap().
>=20
> Would be great if you can take a look whether this behaves as you
> intended for your respective component.
>=20
> Cheers,
> Philipp
>=20
> Philipp Stanner (10):
> =C2=A0 PCI: Make pcim_request_all_regions() a public function
> =C2=A0 ata: ahci: Replace deprecated PCI functions
> =C2=A0 crypto: qat - replace deprecated PCI functions
> =C2=A0 crypto: marvell - replace deprecated PCI functions
> =C2=A0 intel_th: pci: Replace deprecated PCI functions
> =C2=A0 wifi: iwlwifi: replace deprecated PCI functions
> =C2=A0 ntb: idt: Replace deprecated PCI functions
> =C2=A0 serial: rp2: Replace deprecated PCI functions
> =C2=A0 ALSA: korg1212: Replace deprecated PCI functions
> =C2=A0 PCI: Remove pcim_iomap_regions_request_all()
>=20
> =C2=A0.../driver-api/driver-model/devres.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/ata/acard-ahci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +-
> =C2=A0drivers/ata/ahci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> =C2=A0drivers/crypto/intel/qat/qat_420xx/adf_drv.c=C2=A0 | 11 +++-
> =C2=A0drivers/crypto/intel/qat/qat_4xxx/adf_drv.c=C2=A0=C2=A0 | 11 +++-
> =C2=A0.../marvell/octeontx2/otx2_cptpf_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 14 +++--
> =C2=A0.../marvell/octeontx2/otx2_cptvf_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 13 ++--
> =C2=A0drivers/hwtracing/intel_th/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++-
> =C2=A0.../net/wireless/intel/iwlwifi/pcie/trans.c=C2=A0=C2=A0 | 16 ++---
> =C2=A0drivers/ntb/hw/idt/ntb_hw_idt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++--
> =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 +----------------
> --
> =C2=A0drivers/tty/serial/rp2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 ++--
> =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0sound/pci/korg1212/korg1212.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> =C2=A014 files changed, 76 insertions(+), 104 deletions(-)
>=20

