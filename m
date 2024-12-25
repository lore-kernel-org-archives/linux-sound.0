Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8F418E25;
	Wed, 25 Dec 2024 05:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735105128; cv=none; b=OjaHMAQGG9uMcwq+3H5Vb678/QiO1jdlfK8A0Hqf6N+a/BEleet7SeVoG56hOPFOOb+U2n7pSpN9LVhJUhLI1Xhlu+ODKF/aR1e40wvHDf9/QeWx+IlW/8e+PEsdG3A+MCHilpfAk2LKMmGqId7qQLG5fQLBnvcTbKhvRziVyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735105128; c=relaxed/simple;
	bh=zjlEPLnqu32bvG1Vlmf8x+zl3SLjhSQEAtW6cnUwY3w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=n+FKi/fKly9UZVW8HYNG8vyDMwjxa5vvse9FJDLANJIwq2S14lhqdtDhrajg0j6TgEuh8yrUxZGz55H8sbR/3d7jGQ64R0gN2cQkYu9VnvYD/FWBZAJ0i3nfKql/IwKxX23Y0eA0K/+BIlJNDZyjLhbaBWcmB+KbWYLSZotckn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=pZsOkaNu; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="pZsOkaNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735105086;
	bh=1DlpP5M2+VAVmHkj65ImBUu3Uo9aMiQ+mGrgti9XbMc=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=pZsOkaNuQ35RE+qGgTW4UsQTx88tD+wBcSZ0wYkM3F2DkKIzMmHtpjBpsVkKBzSzv
	 eBk5tJc8MTACfNTlF90VaO9Q4fSQLaVkcgiSD5ijC+PqYtKyunOqDk3tt+iDKnZZWT
	 omSTmlmDDxHeeo7cBDYyDqaF6KYpU2tlJeE5Jl+4=
X-QQ-mid: bizesmtp82t1735105081tcqo2x2o
X-QQ-Originating-IP: U/DrdwVE50kJsYs9/9iaLwzTZkGjsjsVjuUSRe+N9VQ=
Received: from smtpclient.apple ( [202.120.235.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Dec 2024 13:38:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13169310443998990785
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
Date: Wed, 25 Dec 2024 13:37:47 +0800
Cc: linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
To: perex@perex.cz,
 tiwai@suse.com
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MAPXug6uMAG51KsSQyn3o89BhGadQ/s3fCugKAd/A2vm2HQE0xGNNCss
	1Wq9/ZHEIb8Lz9fxIAxpXkEXPO9SkqTZaSdLKodKpdFOnzWrFUzx84LV17diNVmqRpCCegz
	1iVfnyOpN5H05+dLK5vz/Mv+KpksiKT8qXUt/3v9zP0eLxgAvw+7sEUnG9T0d6zU+qDw18Z
	sqQfoFGGpfegEXEFGeUk7HbT72Xq4/cbFDvtfqZYAJbtfcvQA0DlWWHs5k4looTM1gtOVj8
	d6eh7Wjnu7QZL8w6Hp4PqRY+ogWhkhSAkMPCysSdYCaLt31MYItmMIov7POEhjyVZZyfUku
	4haK8NZ3qUJyWK+5CCIh4Csz+86nVvDV2ygM2CKXyk43diB9P9Bnj2vQTxj6CLS70sNSE3i
	SNLZRbCOmO2n0Jl1G8e82FE8/p6gCqzCkdUnwqdUGQpoetbzJHQWnp6idy2avwt1HaXKMiV
	9fIjuUhozGA7YxPKw8FDw3sEr3Ti6nls9Jzdg2POKn1lrnsfAZ9esKmeDmnPwkjUqdY+hlj
	J8/PcNdbl3q4fo9Xy8nsjPtK0SSznwQhC29BE+d/o7NNpssL//AHfq85pqDCwXg38JjNvYC
	8AV+i088h8ZAZHuG3F8sMJI6thvBJcvC9rzD0cJuuPT3pWDM1rLs8Pqgir6xdeFqWcm9D01
	LNu6LJiFUJD5suJLpOrLqccL2PKIwgKLpX8HSHZtU7CX1BCC6Zks+VAv59gBD9lSzIf5AHq
	+sMiYQE0SqO61GB+Ggqnpn3greGUes5bJpjQesk13Z14mRdfbtqHD5UcxX0+gbgGIvwsbjI
	uS7l3MK6BAmDdDJngWNGlVP1UMi69R0jZkFU6eHpIVbfMAH7fDieTZrxaG3vpHj/+Tb6XSF
	Ccqa83rvW1vsjrqRQhvaLAFZK4v0Lt16LlT6eSmr36x3WH7QyHAOMB8P7DmNjXpHRpb5Sn4
	TyCLcTA20sBn8AgJOpjzhAQts
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hello,

> BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516

We further analyzed the issue at line 516 in =
./sound/core/seq/oss/seq_oss_synth.c.=20
The slab-out-of-bounds crash occurs in line 509, when sysex->len =3D =
128. Specifically, the write operation to dest[0] accesses memory beyond =
the bounds of sysex->buf (128 byte).
To resolve this issue, we suggest adding 6 lines of code to validate the =
legality of the address write to sysex->buf before entering the loop:

if (sysex->len >=3D MAX_SYSEX_BUFLEN) {=20
   sysex->len =3D 0;=20
   sysex->skip =3D 1;=20
   return -EINVAL;  /* Exit early if sysex->len is out of bounds */=20
}

If you fix this issue, please add the following tag to the commit:
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Thanks,
Kun Hu

> 2024=E5=B9=B412=E6=9C=8824=E6=97=A5 19:16=EF=BC=8CKun Hu =
<huk23@m.fudan.edu.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hello,
>=20
> When using fuzzer tool to fuzz the latest Linux kernel, the following =
crash
> was triggered.
>=20
> HEAD commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
> git tree: upstream
> Console =
output:https://drive.google.com/file/d/17oCyKDW_kNhSW5Bbvm23vnpD1eo0MHFi/v=
iew?usp=3Dsharing
> Kernel config: =
https://drive.google.com/file/d/1RhT5dFTs6Vx1U71PbpenN7TPtnPoa3NI/view?usp=
=3Dsharing
> C reproducer: =
https://drive.google.com/file/d/177HJht6a7-6F3YLudKb_d4kiPGd1VA_i/view?usp=
=3Dsharing
> Syzlang reproducer: =
https://drive.google.com/file/d/1AuP5UGGc47rEXXPuvjmCKgJ3d0U1P84j/view?usp=
=3Dsharing
>=20
>=20
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516
> Write of size 1 at addr ff1100000588e288 by task syz-executor411/824
>=20
> CPU: 2 UID: 0 PID: 824 Comm: syz-executor411 Not tainted 6.13.0-rc3 #5
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
> Call Trace:
> <TASK>
> __dump_stack lib/dump_stack.c:94 [inline]
> dump_stack_lvl+0x116/0x1b0 lib/dump_stack.c:120
> print_address_description mm/kasan/report.c:378 [inline]
> print_report+0xcf/0x5f0 mm/kasan/report.c:489
> kasan_report+0x93/0xc0 mm/kasan/report.c:602
> snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516
> snd_seq_oss_process_event+0x46a/0x2620 =
sound/core/seq/oss/seq_oss_event.c:61
> insert_queue sound/core/seq/oss/seq_oss_rw.c:167 [inline]
> snd_seq_oss_write+0x261/0x7f0 sound/core/seq/oss/seq_oss_rw.c:135
> odev_write+0x53/0xa0 sound/core/seq/oss/seq_oss.c:168
> vfs_write fs/read_write.c:677 [inline]
> vfs_write+0x2e3/0x10f0 fs/read_write.c:659
> ksys_write+0x122/0x240 fs/read_write.c:731
> do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
> entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f69b379994d
> Code: c3 e8 97 2a 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 =
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d =
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f69b3718d78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007f69b382d2d0 RCX: 00007f69b379994d
> RDX: 0000000000000008 RSI: 0000000020000140 RDI: 0000000000000003
> RBP: 00007f69b382d2d8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f69b382d2dc
> R13: 0000000020000140 R14: 00007f69b37fa008 R15: 000000000000000d
> </TASK>
>=20
> Allocated by task 823:
> kasan_save_stack+0x24/0x50 mm/kasan/common.c:47
> kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
> kmalloc_noprof include/linux/slab.h:901 [inline]
> kzalloc_noprof include/linux/slab.h:1037 [inline]
> snd_seq_oss_synth_sysex+0x1d9/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:502
> snd_seq_oss_process_event+0x46a/0x2620 =
sound/core/seq/oss/seq_oss_event.c:61
> insert_queue sound/core/seq/oss/seq_oss_rw.c:167 [inline]
> snd_seq_oss_write+0x261/0x7f0 sound/core/seq/oss/seq_oss_rw.c:135
> odev_write+0x53/0xa0 sound/core/seq/oss/seq_oss.c:168
> vfs_write fs/read_write.c:677 [inline]
> vfs_write+0x2e3/0x10f0 fs/read_write.c:659
> ksys_write+0x122/0x240 fs/read_write.c:731
> do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> The buggy address belongs to the object at ff1100000588e200
> which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 0 bytes to the right of
> allocated 136-byte region [ff1100000588e200, ff1100000588e288)
>=20
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 =
pfn:0x588e
> anon flags: 0x100000000000000(node=3D0|zone=3D1)
> page_type: f5(slab)
> raw: 0100000000000000 ff1100000103c3c0 ffd4000000162340 =
dead000000000003
> raw: 0000000000000000 0000000080100010 00000001f5000000 =
0000000000000000
> page dumped because: kasan: bad access detected
>=20
> Memory state around the buggy address:
> ff1100000588e180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> ff1100000588e200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> ff1100000588e280: 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                      ^
> ff1100000588e300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ff1100000588e380: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> ---------------
> thanks,
> Kun Hu


