Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425731E5701
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454314; cv=none; b=X8/yAXfap+WMILQbpP+yl9klmpF92BtXe+q2i92P8FoGMSqrh/FsYGtxBOoHd3nbF0wuk2d6sMnimSJ6O5vbA3LEpzrqNv43XKN9YxqyiPLwHyCjcZSYC8undY3psad0XnK2otbtm/G85bA/Zz43WUfqpywx5UqeGbTsAyh9k50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454314; c=relaxed/simple;
	bh=f2gz3zGxkAy/2wDgsqilnhq1wXsz6S26o2PLoxsfPy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=Hl1jj60ssX9ebVGPll5/28UQhu2oDuIUgv8UbU/0Q1CX6RM6aQj/vC+dQLNMu35W0XRFGZZvDbDkeZPAsWlNy+Gldk1KX6YYD2gzFTf1SvTXoDowMty4NwtFjN4tcpiFqE7ilu/ktx2h4/udaHFExSXYI6OVRWDLl4ybe0IiKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=lbt5jC0y; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=TfShZkiz; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="lbt5jC0y";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="TfShZkiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753454310; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=f2gz3zGxkAy/2wDgsqilnhq1wXsz6S26o2PLoxsfPy0=;
 b=lbt5jC0yrHWyHfdXXWbo9LqVNTGn5mwAfWOZLNEejvBgV+mjezo6M5cDuVVTrfAbOmB9E
 8G8bNCwKaxpsqKRc/jEXActffB/paTLs9QQL2rJD0mbL5ZBV/ShkCNlNtZzUeZdl6blrDWR
 8+eSdmTC7zioWJuB5xPzyWGRZWxJA9PZvN8R8dWj2cKnGLbIQ1rbq2zD9uuld46F5LBLHxM
 zIOQ1vSuj7YqpzQCgEJ8Xwq34WW4d0n+dRC3q/MnU1klUwWrdUkqoFAd5QjA3mtGYsAoexW
 gxXmLB9qEeYDwGBNwXXaTq3Zrd+KVZOAnHWB/+tWOZfBygtsxwaD7ALCnH+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753454310; h=from : subject :
 to : message-id : date;
 bh=f2gz3zGxkAy/2wDgsqilnhq1wXsz6S26o2PLoxsfPy0=;
 b=TfShZkizP54xSva0a/vye7PF+0mnAZEYEI1+azYKXngUV082lyKmBAH5LZ+8X/44M6rDO
 81pgEevGuVbDD62KJ9TJbREx4xxI6CelSjsJQBuEbnMqZQ2os93uGSSWQqHSVxXDIWB3qLb
 Hsa/wtT5vOg8ySSivhiXGe8rljDeruDknKb7J7FpZy806qDTLF6i4Uh8q1vC68qG5kd0ZAM
 oG6idzMHq9tidtFCJYMwRCpD75ogT3XxiielLS0FR5D74dpVDSsiz5K+VXqAzYYaVriAh5O
 szD63v3nu2brB1J1XnbT1LiuRsjFO4TJ8td+mcsMtR7oSYZtdLMaa4hzHdWg==
Received: from [10.152.250.198] (helo=vilez.localnet)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ufJYy-FnQW0hPs3bB-1ILi;
	Fri, 25 Jul 2025 14:38:20 +0000
From: Edip Hazuri <edip@medip.dev>
To: tiwai@suse.de
Reply-To: 87a54skajh.wl-tiwai@suse.de
Cc: edip@medip.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 perex@perex.cz, stable@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
Date: Fri, 25 Jul 2025 17:38:10 +0300
Message-ID: <5951329.DvuYhMxLoT@vilez>
In-Reply-To: <87a54skajh.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sR_qNS80Cz
X-smtpcorp-track: sgwRQShjXuu4.jWG1FDwF8Wpp.YtRd-AQKPyA

On Friday, July 25, 2025 10:13:38=E2=80=AFAM GMT+03:00 Takashi Iwai wrote:
> On Thu, 24 Jul 2025 23:07:56 +0200,
>=20
> edip@medip.dev wrote:
> > From: Edip Hazuri <edip@medip.dev>
> >=20
> > The mute led on this laptop is using ALC245 but requires a quirk to work
> > This patch enables the existing quirk for the device.
> >=20
> > Tested on Victus 16-r1xxx Laptop. The LED behaviour works
> > as intended.
> >=20
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Edip Hazuri <edip@medip.dev>
>=20
> The HD-audio code was relocated and split to different files recently
> (for 6.17 kernel), e.g. this Realtek codec is now located in
> sound/hda/codecs/realtek/alc269.c.
>=20
> As I already closed the changes for 6.16 and it'll be put for
> 6.17-rc1, could you rebase on for-next branch of sound.git tree and
> resubmit?
>=20
>=20
> thanks,
>=20
> Takashi
Hi

I'll rebase and resubmit it as soon as possible
Thank you


