Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688F2628D;
	Fri, 13 Mar 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413894; cv=none; b=CvHXE3Z9DWNhfuZHtS1xLUBYqPa/uHcOhusuTv0rqnv8AiugDH+xS7Y1TNJg8rB9bGL2CF1pRu+Iuxq908qlKO1X1NOn6uWNlBUPMlRl/p0+QHb6ILS0Gb44yodiVhcfz7dfaJb9AnXJ/Krf0Hfc63Z6hVN/UMuz4XbyCjbje2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413894; c=relaxed/simple;
	bh=FQ8AwGj/JudX8X+yD5F8vvJ8YToyk7hIzS8d0H5D2t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS/brB1BysaLh/jd5GsqqPlznthvVH9S/Xqtpb9/VrbOX4RMeXAGAE3uVTWlGkN2cQgdp7UifP9HIqaM39rjvPyGwD+/LI1RAYy0em329ocknp4JiSvCsLeeukHYbMvcLUi6lqkvLFdrFI+LVEYFh+I0Q7BYqRHjuHqG+9GRoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtBh8INH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtBh8INH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD9FC19421;
	Fri, 13 Mar 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773413893;
	bh=FQ8AwGj/JudX8X+yD5F8vvJ8YToyk7hIzS8d0H5D2t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtBh8INH7KL0FZGqfHL/DmxDkyz7gr2P4IOQlyOP4nmUenMMzSinOLWEOlRb5jf+F
	 Y6IqLqMHSsWmGqPZLpUNUshQTn15eGlkJTkbhQK0zSj9We07zzpquaCFGVemwE5bc+
	 R7MQ+gBzRK8ytqMqUrxxFDzCDbiSOOWItscnfyJrJpSz9T8RH9y+mERAivYtvI2ivX
	 gf/k756gVHTfKTHYL+f6Z9BHSdPYKyazWMC2t2tM6GRXusktbEGjzWpZd4NAYyVrjo
	 gC9Wjh+laUuzc6C9elSN89dSdb8Dn16maodq8+Bwr3N1CgOv1Lgm29+lX3g7Tg4SDD
	 0UB8ktfxgjtKg==
Date: Fri, 13 Mar 2026 14:58:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6DwJL4VGSELluOJI"
Content-Disposition: inline
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
X-Cookie: Monitor not included.


--6DwJL4VGSELluOJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 02:18:07PM +0000, Richard Fitzgerald wrote:
> This series makes some improvements to the code that searches for firmware
> files.
>=20
> Patch 1 is a trivial patch to remove an unused function argument, before
>    adding any new code that uses this API.
>=20
> Patches 2..4 add KUnit testing to prove that the subsequent changes don't
>    break anything.
>=20
> The remaining patches remove duplicated code and clean up some of the
> implementation.

Actually I'm seeing failures with this running on arm64, they were
missed by my testing due to issues with KUnit in -rc1, looking at this
clearly a lot of the problems are knock on results of an initial failure:

[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system: alsa_name:amp1  expects:(=
 )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name:ao system:ABC123 alsa_name:amp1  e=
xpects:( )
[14:52:36] [PASSED] cs1234 dsp1 fwf_name:ao system:ABC123 alsa_name:amp1 wm=
fw_optional expects:( )
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw cirrus/cs1234-dsp1-mbc
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw cirrus/cs
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-dsp1-mbc-vss-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-dsp1-mbc-vss-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:( cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:( cirrus/cs1234-dsp1-mbc-vss-abc123.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1  exp=
ects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mb
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:amp1 wmfw=
_optional expects:( cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Unable to handle kernel paging request at virtual address ffffff=
ffc202b0c8
[14:52:36] Mem abort info:
[14:52:36]   ESR =3D 0x0000000096000006
[14:52:36]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[14:52:36]   SET =3D 0, FnV =3D 0
[14:52:36]   EA =3D 0, S1PTW =3D 0
[14:52:36]   FSC =3D 0x06: level 2 translation fault
[14:52:36] Data abort info:
[14:52:36]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
[14:52:36]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[14:52:36]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[14:52:36] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000040e95000
[14:52:36] [ffffffffc202b0c8] pgd=3D0000000000000000, p4d=3D000000004110340=
3, pud=3D0000000041104403, pmd=3D0000000000000000
[14:52:36] Internal error: Oops: 0000000096000006 [#2]  SMP
[14:52:36] CPU: 0 UID: 0 PID: 11523 Comm: kunit_try_catch Tainted: G      D=
 W        N  7.0.0-rc3-ga7ea17ac86d4 #11 PREEMPTLAZY
[14:52:36] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[14:52:36] Hardware name: linux,dummy-virt (DT)
[14:52:36] pstate: a3400005 (NzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
[14:52:36] pc : kfree+0x38/0x2a0
[14:52:36] lr : release_firmware+0x28/0x6c
[14:52:36] sp : ffff80008348bda0
[14:52:36] x29: ffff80008348bda0 x28: 0000000000000000 x27: 0000000000000000
[14:52:36] x26: 0000000000000000 x25: 0000000000000000 x24: ffff800080fbb850
[14:52:36] x23: ffff8000803e9e80 x22: ffff800080fbb680 x21: ffff000006923b40
[14:52:36] x20: ffff800080ac3010 x19: ffffffffc202b0c0 x18: 0000000000000014
[14:52:36] x17: 00000000f7d33fac x16: 00000000fda59ba1 x15: 00000000e1f102aa
[14:52:36] x14: 000000000000026d x13: 0000000000000000 x12: ffff00003fddaf40
[14:52:36] x11: 00000000000000c0 x10: ffff0000045a26e8 x9 : 0000000000000000
[14:52:36] x8 : ffff00000a1e4cc0 x7 : 0000000000000000 x6 : 0000000000000001
[14:52:36] x5 : 000000000000003c x4 : ffff800080fbb898 x3 : ffff8000803e8820
[14:52:36] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffffffc202b0c0
[14:52:36] Call trace:
[14:52:36]  kfree+0x38/0x2a0 (P)
[14:52:36]  release_firmware+0x28/0x6c
[14:52:36]  wm_adsp_release_firmware_files+0x20/0x80
[14:52:36]  wm_adsp_fw_find_test_case_exit+0x18/0x24
[14:52:36]  kunit_try_run_case_cleanup+0x2c/0x44
[14:52:36]  kunit_generic_run_threadfn_adapter+0x28/0x4c
[14:52:36]  kthread+0x108/0x120
[14:52:36]  ret_from_fork+0x10/0x20
[14:52:36] Code: d34cfe73 f2d83fe0 8b131813 aa1303e0 (f9400661)
[14:52:36] ---[ end trace 0000000000000000 ]---
[14:52:36]     # wm_adsp_fw_find_test_search_order: try faulted: last line =
seen sound/soc/codecs/wm_adsp_fw_find_test.c:193
[14:52:36]     # wm_adsp_fw_find_test_search_order: internal error occurred=
 during test case cleanup: -4
[14:52:36]     # wm_adsp_fw_find_test_search_order: pass:0 fail:21 skip:0 t=
otal:21
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-dsp1-mbc-vss-abc1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw cirrus/cs1234-dsp1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:( cirrus/cs1234-dsp1-mbc-vss-abc123.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name:  expects=
:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vs
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:ABC123 alsa_name: wmfw_opt=
ional expects:( cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36]     # wm_adsp_fw_find_test_search_order: pass:0 fail:14 skip:0 t=
otal:14
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1  expects:(=
cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1  expects:(=
cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1  expects:(=
cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1  expects:(=
cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:amp1 wmfw_optio=
nal expects:( cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36]     # wm_adsp_fw_find_test_search_order: pass:0 fail:9 skip:0 to=
tal:9
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cs12=
34-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name: wmfw_optional =
expects:(cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cs12=
34-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name: wmfw_optional =
expects:(cs1234-dsp1-mbc-vss.wmfw cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cirr=
us/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name: wmfw_optional =
expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cirr=
us/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name: wmfw_optional =
expects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name: wmfw_optional =
expects:( cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36]     # wm_adsp_fw_find_test_search_order: pass:0 fail:9 skip:0 to=
tal:9
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_search=
_order  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:Vendor alsa_name:  expects=
:(cirrus/cs1234-dsp1-mbc-vss-vendor.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:Vendor Device alsa_name:  =
expects:(cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:Vendor_Device alsa_name:  =
expects:(cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:Vendor/Device alsa_name:  =
expects:(cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:1234:56AB alsa_name:  expe=
cts:(cirrus/cs1234-dsp1-mbc-vss-1234-56ab.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:LEFT  expect=
s:(cirrus/cs1234-dsp1-mbc-vss-abc-left.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:LEFT AMP  ex=
pects:(cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:Left Amp  ex=
pects:(cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:Amp_1  expec=
ts:(cirrus/cs1234-dsp1-mbc-vss-abc-amp-1.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:cs1234.1  ex=
pects:(cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:abc alsa_name:Spk/Jack  ex=
pects:(cirrus/cs1234-dsp1-mbc-vss-abc-spk-jack.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_search_order: failed to initialize: -=
16
[14:52:36]     # wm_adsp_fw_find_test_search_order: pass:0 fail:11 skip:0 t=
otal:11
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_search_or=
der =3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wm_adsp_fw_find_test_pic=
k_file  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFBF1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw cirrus/cs1234-dsp1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFBF1111 alsa_name:l1u2  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wfbf1111-l1u2.wmfw cirrus/cs1234-dsp1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WSBF1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw cirrus/cs1234-dsp1-mbc-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WSBF1111 alsa_name:l1u2  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw cirrus/cs1234-dsp1-mbc-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFBF1111 alsa_name:amp1 wm=
fw_optional expects:(cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw cirru
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WSBS1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wsbs1111.wmfw cirrus/cs1234-dsp1-mbc-
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WSBF1111 alsa_name:amp1 wm=
fw_optional expects:(cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw cirrus/cs1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:XXBF1111 alsa_name:amp1 wm=
fw_optional expects:( cirrus/cs1234-dsp1-mbc-vss-xxbf1111-amp1.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFBF1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw cirrus/cs1234-dsp1
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFXX1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss-wfxx1111.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:WFXX1111 alsa_name:amp1 wm=
fw_optional expects:(cirrus/cs1234-dsp1-mbc-vss-wfxx1111.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system:XXXX1111 alsa_name:amp1  e=
xpects:(cirrus/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234nobin dsp1 fwf_name: system:XXXX1111 alsa_name:am=
p1  expects:(cirrus/cs1234nobin-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] wm1234nobin dsp1 fwf_name: system: alsa_name:  expects:=
(wm1234nobin-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] wm1234 dsp1 fwf_name: system: alsa_name:  expects:(wm12=
34-dsp1-mbc-vss.wmfw wm1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234nobin dsp1 fwf_name: system: alsa_name:  expects:=
(cirrus/cs1234nobin-dsp1-mbc-vss.wmfw )
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36] [FAILED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cirr=
us/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_pick_file: failed to initialize: -16
[14:52:36]     # wm_adsp_fw_find_test_pick_file: pass:0 fail:17 skip:0 tota=
l:17
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_pick_f=
ile =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[14:52:36] Error: Driver 'wm_adsp_test_drv' is already registered, aborting=
=2E..
[14:52:36]     # wm_adsp_fw_find_test_find_firmware_byindex: failed to init=
ialize: -16
[14:52:36] [FAILED] wm_adsp_fw_find_test_find_firmware_byindex
[14:52:36]     # module: snd_soc_wm_adsp_test
[14:52:36] # wm-adsp-fw-find: pass:1 fail:7 skip:0 total:8
[14:52:36] # Totals: pass:8 fail:82 skip:0 total:90
[14:52:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm-=
adsp-fw-find =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Failures: wm-adsp-fw-find.wm_adsp_fw_find_test_search_order, wm-adsp-fw-fin=
d.wm_adsp_fw_find_test_search_order, wm-adsp-fw-find.wm_adsp_fw_find_test_s=
earch_order, wm-adsp-fw-find.wm_adsp_fw_find_test_search_order, wm-adsp-fw-=
find.wm_adsp_fw_find_test_search_order, wm-adsp-fw-find.wm_adsp_fw_find_tes=
t_pick_file, wm-adsp-fw-find.wm_adsp_fw_find_test_find_firmware_byindex

--6DwJL4VGSELluOJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0JgAACgkQJNaLcl1U
h9D0yAf/eFSLCETFVmPBwiHfrmXpIaR7CIypR3BJlc4gdCz70rr4YmWeAPNaEeZA
VsDmvTZAgf6s/eC+rdouXuyitHyv6gIRsI1A+qvQW7FnlHopTFo2xJHsNA6XX4U1
1KTqO25IaqWZEb+iLzMmOwg8GCQPmOQ76sdkwab2u/61FzLv3CJE7NGlRLFQaniu
cEqZTZ7IXdzG36VqDBQEmLY9Pr+u2D97xkH+Dm8Kiyh/QOSEv+ef6Yje25KUUc9B
dhCfAY1yxwH+djXDuG0sl05uUrSZHz57w+fagEQA8cZECZX7d3/nyDdk7k3oc48V
WlRijGE4C2NIeNuxzlHyyzxivI1QKA==
=xgEf
-----END PGP SIGNATURE-----

--6DwJL4VGSELluOJI--
