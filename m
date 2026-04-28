Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BC352C3C;
	Tue, 28 Apr 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372875; cv=pass; b=X0pz7/sSr5MIj93gQrzsSrW63feQfRYm5LUHaUvKl7R7aObcOXUNdIw66eJ8o0y2J0y7xhjTfsVNHEFXg3ioITwo49NWYWzb3yhOczG0N6BNugWjN7sjq2BPmJz1atRHJNUNwgB4TN7rJP1+bG2OGPB0xihHXcAkznZ2R1NdipI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372875; c=relaxed/simple;
	bh=GS1hS/8peRnuuD17RTQ+cDFo7pzYqWQZE43VZsYVZRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8ZUUQpNyLp0NW41qoagkLJBICJJvg7tKA9AOFWfWqYp71xPTBcKNeSLv5DOhJ/rpVp9GPJw0X9bRRUrxRB0bAFTqquyJghkeoEV3QkFMGj9Xw3gHcQ+ufMlea0D/KULglwaumF1ndlQanUeYveo6xrv1oHr1SVmUi+mQSkfrEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=iIpi8sxM; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="iIpi8sxM"
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1777372856;
	b=KlCUN8cxGtNYC1tl50gJ57HcEwKrdGaosDrV0qV44Yh5w7u8mVPNIVC1lGiCEErkGUrz
	 8NgbwHc3ytPjXgRY2TE3Kjdw/uKxBHEn+5XNhr+mbDaUy/slodQOr4u7N2sJLaWhXn99T
	 jwkPAcuIFQP+kPfqkW2/QBbH8FbZojZYmg=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1777372856;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=Ccz1qwmSFsGa6gBIsc9RuWdnuMW3Km1n7RJgmdjGwUM=;
	b=hHvhI4qlY0FOeHLUMaN+UzkVzM3K/leD5GieiBx5XYuBIABjhsEoAl4gjXxySYsD2lw8
	 rViFOWeZzPAsDO44YEnxPFDK3/LJjJx2tfgIYFDtyyemdsKkfEmKbVDKOE/FnAM26aeMd
	 vWy7zAAUynRglcPTjS185whrqXPH9luh/w=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63SAenie3291243
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 18:40:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1777372856;
	bh=Ccz1qwmSFsGa6gBIsc9RuWdnuMW3Km1n7RJgmdjGwUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIpi8sxMMwMv/aEFpw3SJTScj4wJ7QQwWY+GGD7L9ARDfMnlQLal2ig7Dv4uF4WOz
	 8tc6k/MqM8DWoqfqNpQiGDL+5IkF9/XxRykv5I9nhHa5u7Nm0dAQV0VatcwNfffoij
	 uv0NMc785Ojrjl+9n2aYm2aifdgJrJ3w/Q93EDCw=
Date: Tue, 28 Apr 2026 18:40:44 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: cs35l56: Put ACPI device after setting
 companion
Message-ID: <20260428104044.GA1898666@chcpu16>
References: <20260428074415.GA1632446@chcpu16>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428074415.GA1632446@chcpu16>
X-Env-From: sfual

Hi Richard,

> Are you sure about this?
> I remember when I wrote this code I checked the driver core and saw that
> if there is a companion it puts it when the driver is removed.
> That is why I didn't put the reference here, it would have caused a
> double put.

I may well be missing something here. But from my reading of the current
code, it does not seem to cause a double put.

The place where I do seem to find ACPI companion cleanup is when the device 
object itself is deleted/unregistered:

  `device_del()`
    -> `device_platform_notify_remove()`
    -> `acpi_device_notify_remove()`
    -> `acpi_unbind_one()`

What makes me think this is not the matching put for
`acpi_dev_get_first_match_dev()` is that `acpi_unbind_one()` only calls
`acpi_dev_put()` after it finds a matching entry for the device in
`acpi_dev->physical_node_list`.

As far as I can tell, that list entry is created by `acpi_bind_one()`, which
also takes its own extra reference with `acpi_dev_get(acpi_dev)`. So the put
in `acpi_unbind_one()` looks to me like it is paired with that
`acpi_bind_one()` reference, rather than with the earlier
`acpi_dev_get_first_match_dev()` lookup.

If that reading is right, then I think the ownership looks like this:

- `ACPI_COMPANION_SET()` only attaches the companion pointer/fwnode
- the lookup reference from `acpi_dev_get_first_match_dev()` is still with
  the caller
- `acpi_dev_put(adev)` after `ACPI_COMPANION_SET()` balances only that
  lookup reference
- the later `acpi_unbind_one()` path would not be putting the same
  reference again, because that put is for the separate ref taken by
  `acpi_bind_one()`

Part of why I leaned that way is that I found a couple of in-tree examples
that seem to follow the same pattern:

- `drivers/platform/x86/x86-android-tablets/core.c`
  does `acpi_dev_get_first_match_dev()`, `ACPI_COMPANION_SET()`, then
  `acpi_dev_put()`

- `drivers/acpi/arm64/mpam.c`
  does `acpi_dev_get_first_match_dev()`, `ACPI_COMPANION_SET()`, then
  `acpi_dev_put()`

So from my own understanding, those examples also seem to treat
`ACPI_COMPANION_SET()` as not consuming the reference returned by
`acpi_dev_get_first_match_dev()`.

But this is only my reading of the current ownership flow, so if I am
overlooking some rule around manually assigned companions I am happy to
re-check.

Best regards,
Shuhao
