Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C622446C00
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791035; cv=pass; b=oIVNcy1SEKXP/Rf1CgN2OasRj55Eee24k65Z8hWJpvI22dcaZ1tazPVc0QivkYXKLtxCK5mnzW2d79wZ8bBLav8X2kNAWpXQBFz9QhQhIcpHHgLjFR9edwaZ0Lky0OFVDV+2ah9e6DfH36r7yE54D+n6xVduQLfukJTiSfhcU0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791035; c=relaxed/simple;
	bh=1313kDVxsSPOyGR3snxodlNowfc7x2BBB/lPDFxOcT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXjBTbCIRKA5Hym9Xk2ZJu2DmfW69EdGAq40eVsUfuBuWUId0y8+mvZHosS6syRlvJc7wqkcLzBF8cxsl/Wkf1WVQoSJmYtAa5pzxbLjFCrprzHXYRi1gcof7BXMuH+NjBmHhsrawegrd1zHxR5fP9sp5Jdwo8GmCqQl45lg8JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOplqCJs; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOplqCJs"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e935294673so1416846e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 00:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791791032; cv=none;
        d=google.com; s=arc-20260327;
        b=cx/rjquc71YQrk9mst0yAuiKjKsfeT+0dUiEXX8M59+yqbwk2IPvJKVTTiEekToe9p
         GA3mq6OUZdX/9c/n8LUIvHkFNQmfZsPl/FzjgidsxVy6o4tJQZk0be73v5/XM1YRgIAD
         AekVhaq2FsSrW0b2hJat1tZwmGI0Hrm9QMdQJBBqvUzdTO9pTdh70T8ZyxnXRPHwm6UO
         SNm+I5WtLVLIR/Ltee19BceivPwUZ6dstgx1o3XMVZkyyZLzbhgo2gubvl5eNXemG8JT
         AfMbuW4sy2Ovyp0DaivkdFuh7PZqnytpyQPf9LwXrQ7hhaX3AcwH1k4LllCPbrgooxnd
         k8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1313kDVxsSPOyGR3snxodlNowfc7x2BBB/lPDFxOcT8=;
        fh=ulllRlyNLRcR9hut3jeiYLivB54nN7gnA1cdUh/KQYw=;
        b=eg59IlVeJFrZNjii2r8oM3742nyNdz2ONx7I7Cgry9ZwWx8Om9esLyMcvJznZP4uxF
         9NswYgIYQk6kcaVCYQaTTb4tnvFSPsf4Ls9YcVIaVYVQzFylW061dn4Ovg9jmJCXxjib
         HWcNprbVYy6XTZjdkAdGXp7bNqm0xJpM8qe1XtbhZbg3Vm0Nl+rM7HVwUR8eUT1rIBqR
         51vENknqJu/R6KuLvnEf4abM4bzqMYyqpuUAMa0PTElCQg6xvzyShYHfiIm/AbPnCdsT
         3RnY/QllsSUgx/OW6a3DzDk9X80W7QEL5xGh8fJyaxNtbf13jy+qtN2G1Y94mI5Den4S
         OqzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791032; x=1792395832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1313kDVxsSPOyGR3snxodlNowfc7x2BBB/lPDFxOcT8=;
        b=QOplqCJskE4LusTC9LummM7amsQYPE87c3OT5J7JEI+11v8eVPQDi2UcFQpLfQi5o+
         p4Lk5r943iVs10qC5KUmgWonxftxBg7axpiowpHrwOleFEChMwyoEklCKFKyfaNo8DO0
         oZNOTKkonyjAvZQmgVTopiIyBUSiDyHYHlh1Wf86RIPG6T44V9e0vsHo7i7yUu69E7gf
         LslpDd5pMETaIfpKyiykK36KlRnDutmJwpv6mJuvN/1djOWX/JOscAA4Re5RBYCTeKP2
         bCqZUpUHKsHJbLNKc8wejjQO90Yabko/B7gNt55VbvGs2rmWYSr7VzysSl3P6xwYyfgQ
         Gjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791032; x=1792395832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1313kDVxsSPOyGR3snxodlNowfc7x2BBB/lPDFxOcT8=;
        b=WirIt4blh2VJdi8M0t+PLY6jndn22oihry9eICIiX+uFrQWJow2XPBX27zYx72cAM4
         T3jlmaUZRitjUNI2+DFj71HZ5rL8jDX+q6TU2J5+9UuySHo3Mgou1JboxKHAK3O1w9YB
         TxxXGfLDwaOPxwybt311AoTh82CZ992IfLuXVWgZAAeghZV997dFBXwyS69hCRaUnZKf
         6HoIW9QdSdG+a5MkSiquHloHDxDhgXVAhAFdTCMbiyd1MEf5c/bXby2xvyz99ExlH3Tj
         /X8zIjdVhByZCd2akvWssNyeKkKg0IkSGi9qmebaanXwIdZf2N065wBSYHoDu52Ubb0F
         fQTg==
X-Forwarded-Encrypted: i=1; AKwUvBxrl21WGMjMDUPB/hHlaCuODu5sM3Daj9pPnA8Jr8ACl1dut0k1IsaVh0WeH8Mc1JoSt9sxw7fViowaAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLSNZKQlcEYlxp4nzAsY8XhY29Xzcey3RGy6pTAOM2tPPLaVhiM
	ra/qYY9ET+tfbSm85I7hCpy2grxdbw/fd5BsHxYpP3twuNYowhITrcUMCb63Bw5uMDC7VwsFYZB
	OoCodv4xZiS1jLFrrZSy7rCfdwnoujPI=
X-Gm-Gg: AYBFou3fYimgPBYJ1NdtG49VVuwJV8fKFcxg2OVNaJ78N5MPRFkC2Tv0zv9B3EgEnoY
	rNwei/Bkmym7qvmQhMwTnr7Fiw5Auuc7BvhLVS/uB93szctVlejqDlmHtC/wJpKWB6SGeHXRahj
	pa2o2B0VmnSkh8vP9iFSIlDnh405xK2Vfl2oax54qmbLergKxadBBnwALhgljb+pZHeYOhxj/F+
	0nehZorxhLVllMYhvoTm6Gft5fWORiJN88TD1opse2W1XuY3ZOSs6bdWU0fu6jH9/1JVBcFMaF/
	uQmHf3SfNEoW9lRST4CfDGfACbVWG8Kbo73nkZBgr0F+AGHSne2krS4js7Rmzl9rngoi+gXGlqy
	FMgzMVZ/x0AIAZ8W5BaK5tL/PCBhkkOR67q0p56aqp8H53usWY7jE9fb2NivOA7Ph2NbGxzTJ9L
	zknITb73duyq5cEhVqF1cGhb80qYs/KD6RePOTDD5BRGY+yQwBPPb0
X-Received: by 2002:a05:6122:4f9d:b0:5c9:a830:44cb with SMTP id
 71dfb90a1353d-5e91f4bb571mr2225459e0c.8.1791791032427; Mon, 12 Oct 2026
 00:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
 <3eae2a23-81f3-4776-ae03-a32c80ad450c@amd.com>
In-Reply-To: <3eae2a23-81f3-4776-ae03-a32c80ad450c@amd.com>
From: =?UTF-8?Q?Marek_Bor=C5=AFvka?= <boruvka.marek@gmail.com>
Date: Mon, 12 Oct 2026 09:43:40 +0200
X-Gm-Features: AclHuK87uzOB1saly_Kjg1h2guqnInKPWzInolCJAyLE0UsEecJ6QmkazI0vunI
Message-ID: <CANQNuJsDHEHXF6nop53SgzOCqESHzabRS4cV8a2E-UDNDUOWnA@mail.gmail.com>
Subject: Re: ASoC: amd: yc: AMD-Vi IO_PAGE_FAULT at address 0xfffffffffffffffc
 on every DMIC capture start (Lenovo Yoga 7 14ARB7, 82QF)
To: vijendar.mukunda@amd.com, linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, broonie@kernel.org, 
	Mario.Limonciello@amd.com, syed.sabakareem@amd.com, 
	Sunil-kumar.Dommati@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/12/26 04:48 UTC, Vijendar Mukunda wrote:
> Could you please open a Kernel Bugzilla ticket ?
> Attach alsa info, DMI decode info, lspci -vvv output, dmesg logs and
> ACPI DUMP.

Done: https://bugzilla.kernel.org/show_bug.cgi?id=3D222119

All requested files are attached there as one archive (public.zip):
alsa-info, dmidecode, lspci -vvv -nn, dmesg and acpidump. Serial
numbers, UUIDs, MAC addresses and the MSDM table body were removed.

Correction to my first mail: the fault does not happen on every capture
start. After a fresh boot I could not trigger it at all (0 faults with
five different ways of opening the capture). After one s2idle
suspend/resume, the first capture produced one fault. In the journal,
every boot with faults had a suspend/resume before the first fault.
The dmesg in the ticket was taken after suspend/resume and contains
the fault.

Thanks,
Marek Bor=C5=AFvka
