Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B201D2F4A
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845487; cv=none; b=d+g5o3IHZBuiG8FIb2i9VxZA4Bd4d3dRR79cYN/ysrE5+BKAbkclQRUhEV5wlvI2XkVqOpw7Z0lA8juiOfYGZLMvLwgHzhzS8YwX5U0MuV1/z7ZYfWerFE9SV+XGM2FEphVoDQbUBB/b1J35AIXqVE6ZNe4hcE1M0Ys0leJVzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845487; c=relaxed/simple;
	bh=+CU0p5rXSrPP3uBwt5801R3G6t7PRg+8+rdxS6Av4Qw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAfXPd5i4ErrtbFZ4RAtOmWKMgDIRuYeA7aw9GfNxasAIFbWLGKIYZj4aC1aAUAEmhVyuPxUPWqwzM7dLRy/R1wEjEKuNGATwdIM5s/p54aF6HOkBQpLIKp4H+MNwMcmAvTcfObzoKkmdceRvGOEdSzaOtoruKJ9lR8r8OHng0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RYVSEflY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RYVSEflY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729845484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CU0p5rXSrPP3uBwt5801R3G6t7PRg+8+rdxS6Av4Qw=;
	b=RYVSEflY+ANZllCmr1c7jOH5pXppyday3td/Ikv55t2h/8bvwhQ+S1Ehi+uOValsfwxohR
	F4H2L9JTUg+soz6waYRhkyPW1vW33OA/g/+agWiuuKceK7zU8+GfCRhMw2gbNBlGzBZrZn
	F8V86tkTLQZIddEZDD5zvJl//ANi9DE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-AiktfdFdNb6ha6TJ5NYZ1Q-1; Fri, 25 Oct 2024 04:38:03 -0400
X-MC-Unique: AiktfdFdNb6ha6TJ5NYZ1Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d45f1e935so956734f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 01:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845481; x=1730450281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5SfsCaa6OQtbrocW2yvj8So2+UMhrgJURtFbTDl4+U=;
        b=aYM2aHRqo5mG+GsRW0fsZLJk2dL9dmb6wQsnwOdIyArxCmEr5y5GwtWGZGr1SmTU8D
         eme6tgf7cJ5HwKTeViEBO5AHi55ogz/s2MzEazGG+rPiCGGoSclYcD75zFEqDw2tMzpH
         ircrRgQ6yyzJAEGHEkCoaUp3IxOlTNP5vt+C4FW5HbPGFCf6UB2dhQnHV4vqhRFPYAur
         dUTdCLNJ04XCJnbUfWveIcbYybnmqtn6NyjxD8QdYnztlRJ6G5cfm4TDarRIJUH3xyBc
         ZfnKpcVJ1904UqH/iC6G2rQziOQUVJdcuBUCCGVl8X/DdhUIWwG5fGDuEcypH44tQBe4
         mXhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBhBY1SxD8ljyagsNtDMJHt11OT8+FQ3i3AuvaLCsoD3+/cwtlY1/8UHjhU5odbpoYeRMGtNGREASE0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLXJmxwTiK+jakN2X+Gq04NlfzuPzugUXRP+K5VCULE5408ab
	8zMRS56/tbrFuk8Y5EyAGbQlG+ngUrzn8ZlBX4cg93nZFBrA0tquTgx5dk3C5hcdv69mN3VxNnf
	H7C1glEKRCsLuPIF142YsZEncJ4PaQ458Sboer/HCCYTiCeME8Puhia123/bw
X-Received: by 2002:a5d:45d2:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-37efcf78dadmr5976785f8f.42.1729845481084;
        Fri, 25 Oct 2024 01:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcYWpz+kQZdr3vU0ccyDv2e4lUiNEwepdTyBtEeS9wkTJkf/x/0hfBIa/kJv59+/PzqJJV1A==
X-Received: by 2002:a5d:45d2:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-37efcf78dadmr5976745f8f.42.1729845480512;
        Fri, 25 Oct 2024 01:38:00 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2de5:ba00:738a:c8da:daac:7543? (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70c44sm932452f8f.80.2024.10.25.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:38:00 -0700 (PDT)
Message-ID: <ae081c36c49733b007a8946dceeec0af94fc449a.camel@redhat.com>
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of
 pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>,  Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 25 Oct 2024 10:37:57 +0200
In-Reply-To: <875xphzeun.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-3-pstanner@redhat.com> <87v7xk2ps5.wl-tiwai@suse.de>
	 <6f3db65fe9a5dcd1a7a8d9bd5352ecb248ef57b1.camel@redhat.com>
	 <87ttd2276j.wl-tiwai@suse.de>
	 <aec23bb79b9ff7dd7f13eb67460e0605eac22912.camel@redhat.com>
	 <875xphzeun.wl-tiwai@suse.de>
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

On Thu, 2024-10-24 at 17:43 +0200, Takashi Iwai wrote:
> On Thu, 24 Oct 2024 10:02:59 +0200,
> Philipp Stanner wrote:
> >=20
> > On Wed, 2024-10-23 at 17:03 +0200, Takashi Iwai wrote:
> > > On Wed, 23 Oct 2024 15:50:09 +0200,
> > > Philipp Stanner wrote:
> > > >=20
> > > > On Tue, 2024-10-22 at 16:08 +0200, Takashi Iwai wrote:
> > > > > On Tue, 15 Oct 2024 20:51:12 +0200,
> > > > > Philipp Stanner wrote:
> > > > > >=20
> > > > > > pci_intx() is a hybrid function which can sometimes be
> > > > > > managed
> > > > > > through
> > > > > > devres. To remove this hybrid nature from pci_intx(), it is
> > > > > > necessary to
> > > > > > port users to either an always-managed or a never-managed
> > > > > > version.
> > > > > >=20
> > > > > > hda_intel enables its PCI-Device with pcim_enable_device().
> > > > > > Thus,
> > > > > > it needs
> > > > > > the always-managed version.
> > > > > >=20
> > > > > > Replace pci_intx() with pcim_intx().
> > > > > >=20
> > > > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > > > ---
> > > > > > =C2=A0sound/pci/hda/hda_intel.c | 2 +-
> > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/sound/pci/hda/hda_intel.c
> > > > > > b/sound/pci/hda/hda_intel.c
> > > > > > index b4540c5cd2a6..b44ca7b6e54f 100644
> > > > > > --- a/sound/pci/hda/hda_intel.c
> > > > > > +++ b/sound/pci/hda/hda_intel.c
> > > > > > @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx
> > > > > > *chip,
> > > > > > int do_disconnect)
> > > > > > =C2=A0=09}
> > > > > > =C2=A0=09bus->irq =3D chip->pci->irq;
> > > > > > =C2=A0=09chip->card->sync_irq =3D bus->irq;
> > > > > > -=09pci_intx(chip->pci, !chip->msi);
> > > > > > +=09pcim_intx(chip->pci, !chip->msi);
> > > > > > =C2=A0=09return 0;
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > >=20
> > > > > Hm, it's OK-ish to do this as it's practically same as what
> > > > > pci_intx()
> > > > > currently does.=C2=A0 But, the current code can be a bit
> > > > > inconsistent
> > > > > about
> > > > > the original intx value.=C2=A0 pcim_intx() always stores !enable
> > > > > to
> > > > > res->orig_intx unconditionally, and it means that the
> > > > > orig_intx
> > > > > value
> > > > > gets overridden at each time pcim_intx() gets called.
> > > >=20
> > > > Yes.
> > > >=20
> > > > >=20
> > > > > Meanwhile, HD-audio driver does release and re-acquire the
> > > > > interrupt
> > > > > after disabling MSI when something goes wrong, and pci_intx()
> > > > > call
> > > > > above is a part of that procedure.=C2=A0 So, it can rewrite the
> > > > > res->orig_intx to another value by retry without MSI.=C2=A0 And
> > > > > after
> > > > > the
> > > > > driver removal, it'll lead to another state.
> > > >=20
> > > > I'm not sure that I understand this paragraph completely.
> > > > Still,
> > > > could
> > > > a solution for the driver on the long-term just be to use
> > > > pci_intx()?
> > >=20
> > > pci_intx() misses the restore of the original value, so it's no
> > > long-term solution, either.
> >=20
> > Sure that is missing =E2=80=93 I was basically asking whether the drive=
r
> > could
> > live without that feature.
> >=20
> > Consider that point obsolete, see below
> >=20
> > >=20
> > > What I meant is that pcim_intx() blindly assumes the negative of
> > > the
> > > passed argument as the original state, which isn't always true.=C2=A0
> > > e.g.
> > > when the driver calls it twice with different values, a wrong
> > > value
> > > may be remembered.
> >=20
> > Ah, I see =E2=80=93 thoguh the issue is when it's called several times =
with
> > the
> > *same* value, isn't it?
> >=20
> > E.g.
> >=20
> > pcim_intx(pdev, 1); // 0 is remembered as the old value
> > pcim_intx(pdev, 1); // 0 is falsely remembered as the old value
> >=20
> > Also, it would seem that calling the function for the first time
> > like
> > that:
> >=20
> > pcim_intx(pdev, 0); // old value: 1
> >=20
> > is at least incorrect, because INTx should be 0 per default,
> > shouldn't
> > it? Could then even be a 1st class bug, because INTx would end up
> > being
> > enabled despite having been disabled all the time.
>=20
> Yeah, and the unexpected restore can happen even with a single call
> of
> pcim_intx(), if the driver calls it unnecessarily.
>=20
> > > That said, I thought of something like below.
> >=20
> > At first glance that looks like a good idea to me, thanks for
> > working
> > this out!
> >=20
> > IMO you can submit that as a patch so we can discuss it separately.
>=20
> Sure, I'm going to submit later.

I just took a look into the old implementation of pci_intx() (there was
no pcim_intx() back then), before I started cleaning up PCI's devres.
This what it looked like before
25216afc9db53d85dc648aba8fb7f6d31f2c8731:

void pci_intx(struct pci_dev *pdev, int enable)
{
=09u16 pci_command, new;

=09pci_read_config_word(pdev, PCI_COMMAND, &pci_command);

=09if (enable)
=09=09new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
=09else
=09=09new =3D pci_command | PCI_COMMAND_INTX_DISABLE;

=09if (new !=3D pci_command) {
=09=09struct pci_devres *dr;

=09=09pci_write_config_word(pdev, PCI_COMMAND, new);

=09=09dr =3D find_pci_dr(pdev);
=09=09if (dr && !dr->restore_intx) {
=09=09=09dr->restore_intx =3D 1;
=09=09=09dr->orig_intx =3D !enable;
=09=09}
=09}
}
EXPORT_SYMBOL_GPL(pci_intx);

If I'm not mistaken the old version did not have the problem because
the value to be restored only changed if new !=3D pci_command.

That should always be correct, what do you think?

If so, only my commit 25216afc9db53d85dc648aba8fb7f6d31f2c8731 needs to
be fixed.

Thanks,
P.


>=20
>=20
> thanks,
>=20
> Takashi
>=20

