Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793474829;
	b=qjyQto87uaLCvByVciWlwesRRVRc1ib/BbaO5carn1xHJkauI1d50VvoSbu2GqgtjA55
	 2TGzBqXmrjwXpuRJz5PHTEswNfCjIrJkK78jfLZ22FkxxcLdVxl4tCOZxx13dsjph9G+Q
	 sWORoaq6hG5+SgX6dtfwRvzeVyFrxyqqPOK8E+1gI8g7RY68CXL6dmIg/0c3R9BKKIZxS
	 UmQ+V3jKixYcdrp3nL/2Q6Prcz2utKn/JTy7BVklT4+Doyw99S9slQ4o1/PpFof5xu3Om
	 s2zaoagFOwzuy/Yfs9IH63rTTOjMD5JE4DySLI5t/Fndx9dJr7WKDPvVZx4xyl5hEng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793474829;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WRPskuI9TwcZNo82HYKQW+nBXyCj4O2qckDJhyWGS+o=;
	b=qlx21oVpCuwH4M1paXmF1+gusrXGXUkVAvcVNKzEopJanf4NFJZsKp6W+icrHUsXBWqR
	 gXPPYgbkXUKstsg/1rNPytTzkA4WxHGAWw/ZgkpnMm1gjyGuSD0L/IQq61AVB2wXktOUe
	 iI7i9uWgiDX7kOrDrl6ZEuOA2s2c6389UKziIxoCIos20PCszwfO6hRbNuUSz0B8E29oQ
	 VdOMUa3pQYq8Y3Svhd8im03mCAwztF1uwMfTbSa9Sk/YlaMJbTVLSMQkW9yiFcrx3NDjD
	 QjrDqpgCEmo0/RMw364QWl+xKA39z/KKTaWqZ+TrT+IHm4Qhi7MVAm7GVYHvHN7K6Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=malyuta.name;
	spf=pass smtp.mailfrom=malyuta.name;
	dkim=pass header.d=malyuta.name header.i=@malyuta.name header.a=rsa-sha256 header.s=protonmail header.b=Tfta2dK8;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B84606A31C
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 19:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=malyuta.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=malyuta.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=malyuta.name header.i=@malyuta.name header.a=rsa-sha256 header.s=protonmail header.b=Tfta2dK8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=malyuta.name;
	s=protonmail; t=1793474826; x=1793734026;
	bh=WRPskuI9TwcZNo82HYKQW+nBXyCj4O2qckDJhyWGS+o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Tfta2dK8fu3g7prNk6+Za+AUw2ta7/HhctNpEdrYzICmFyIp40aasDN8/KDfkAijc
	 1e0FQ+0j0U5NTvEEoAojYF7cmuGeTvzwC/BO4xDFis3ocO3UCwjy6NTMvfmXHFAYVw
	 T+0lfnwHVsDvZZJdUgOIOdLKkDKkV0vsBYZsIR8eLiEBCA9BybGKo0nJ9yvCFDmdsn
	 +L4z92E38kbd1rUT+NW2MwKi9jpI/BR8I3eVXw60dWctdEs7jByXHPf5z03O6NtyaD
	 PjGJe6EhAfsfK78GbdKT9TflzcIyKJQIZyqf1MfEUUnzF1BIc2Js4hD8FWpJC4B5sV
	 DcX5GW17SJ/0A==
Date: Sat, 31 Oct 2026 19:27:00 +0000
To: "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>, "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>
From: Danylo Malyuta <danylo@malyuta.name>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>
Subject: [BUG] ALSA: hda/cs35l41: hibernation deadlock between fw_load_work queued at thaw and cs35l41_system_suspend_prep
Message-ID: <qPs6xwraoKtrXcbKzWmB-Y16t8enjkyONsARL-2-9nSu8CG66cEcaisrghfDNENetpPfrev5kvxb5XLT7FL03FaAyQ_q9TD3K8n-4OSzEYY=@malyuta.name>
Feedback-ID: 14755124:user:proton
X-Pm-Message-ID: a0b5c81e8140306d62eaec18712a19ef72b37a20
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello David and Richard,

I hope you all are doing well. I am writing to report a "hibernation hang" =
bug that I encountered on my=C2=A0ASUS ProArt PX13 HN7306WU laptop running=
=C2=A0Fedora Linux 44 on the=C2=A07.2.13-200.fc44.x86_64 kernel. The behavi=
oral issue is that when putting the laptop to hibernate (systemctl hibernat=
e), it would "hang" at the very end with the power button still lit but eve=
rything else off/screen dark and the computer completely unresponsive to an=
ything but holding the power button until it shuts off. Turning back on, th=
e saved session comes back - so everything gets saved properly, it's just t=
hat the laptop fails to shut itself off. This would happen randomly and rar=
ely, in maybe 1 out of every 10 hibernations.

I am not a Linux kernel wizard, so full disclosure I worked through Claude =
Opus 5.5 to figure out the problem. After about a week of attempts and the =
AI writing trace and logging logic to run during sleep/hibernation, I final=
ly root caused the issue as being the=C2=A0CS35L41 driver deadlocking. The =
bug submission text below is fully composed by Claude, because it is beyond=
 my linux experience to compose an issue report like this. The previous par=
agraph and this one, however, were written by me. I hope that the following=
 is useful to you as I believe it is the first time anyone is reporting thi=
s problem with the driver. I also want to thank you all for your work maint=
aining the audio system and supporting the open source community.

------

Hibernation (S4, platform mode) deadlocks on my laptop with two
CS35L41 HDA amps. The image is written, then the machine hangs before
powering off (screen black, power LED on, ~13 W) until it is forced
off. In normal use this happened in about 1 in 20 hibernations. With
the page cache dropped right before hibernating, it happens every time.

System:
- ASUS ProArt PX13 HN7306WU, BIOS HN7306WU.318 05/04/2026
- CSC3551, two amps (i2c-CSC3551:00-cs35l41-hda.0 and .1),
  snd_hda_scodec_cs35l41, firmware cs35l41-dsp1-spk-prot-10431ed3
  (Fedora cirrus-audio-firmware-20261019)
- Fedora kernel 7.2.13-200.fc44. It is tainted (OE) by the NVIDIA
  module, which is not involved; I can retest without it.
- Root filesystem and the hibernation swap file both on btrfs

The relevant code is unchanged in mainline (7.3) and in sound.git
for-next.

What happens, from a softdog panic (soft_panic=3D1,
panic_sys_info=3Dblocked_tasks) whose log was saved with efi-pstore:

1. After the hibernation image is created, the thaw runs
   cs35l41_system_resume(), since SYSTEM_SLEEP_PM_OPS uses it for
   .thaw too. With request_fw_load set, it queues
   cs35l41->fw_load_work.

2. The image is written ("PM: Image saving done").

3. hibernation_platform_enter() -> dpm_suspend_start() ->
   dpm_prepare() -> cs35l41_system_suspend_prep() blocks on
   cs35l41->fw_mutex.

4. fw_mutex is held by cs35l41_fw_load_work(). It is in
   request_firmware(), in a btrfs directory lookup, waiting for a
   metadata read. btrfs completes metadata reads on its
   "btrfs-endio-meta" workqueue (btrfs_simple_end_io() ->
   btrfs_end_io_wq() in fs/btrfs/bio.c), which btrfs_init_workqueues()
   allocates with WQ_FREEZABLE. That workqueue is frozen at this point,
   so the read never completes. The btrfs-transaction thread is stuck
   on such a read too.

So it deadlocks whenever the firmware load at the thaw misses the
dentry or page cache. Usually it doesn't, because the amps reload
their firmware at every resume. But hibernate_preallocate_memory() can
evict those files under memory pressure. The first logged hang was
right after a large dnf transaction: setting aside the image memory
took 3.2 s, against ~1.3 s in the hibernations just before.

Timeline of the reproduced hang:

  PM: thaw of devices complete after 784.342 msecs
  PM: hibernation: Writing hibernation image.
  PM: Image saving done
  printk: Suspending console(s) (use no_console_suspend to debug)
  softdog: Initiating panic                  <- 280 s later
  Kernel panic - not syncing: Software Watchdog Timer expired

The stuck tasks, trimmed (the full ~93 KB log is available):

task:systemd-sleep   state:D stack:0     pid:66843 tgid:66843 ppid:1
 __mutex_lock.constprop.0+0x449/0xa70
 cs35l41_system_suspend_prep+0x31/0xb0 [snd_hda_scodec_cs35l41]
 device_prepare+0xaf/0x270
 dpm_prepare+0x114/0x290
 dpm_suspend_start+0x1e/0x60
 hibernation_platform_enter+0x5b/0x150
 hibernate.cold+0x3a7/0x4b5
 state_store+0x45/0x60
 kernfs_fop_write_iter+0x178/0x200
 vfs_write+0x281/0x560
 ksys_write+0x7b/0x110
 do_syscall_64+0xe2/0x570

task:kworker/12:1    state:D stack:0     pid:28203 tgid:28203 ppid:2
Workqueue: events cs35l41_fw_load_work [snd_hda_scodec_cs35l41]
 io_schedule+0x46/0x70
 bit_wait_io+0x11/0x70
 __wait_on_bit+0x92/0xb0
 out_of_line_wait_on_bit+0x97/0xc0
 read_extent_buffer_pages+0x47/0x60
 btrfs_read_extent_buffer+0x69/0xa0
 read_block_for_search+0x201/0x3e0
 btrfs_search_slot+0x39e/0x1210
 btrfs_lookup_dir_item+0x8e/0xf0
 btrfs_lookup_dentry+0x122/0x5b0
 btrfs_lookup+0x16/0x30
 lookup_open.isra.0+0x1c1/0x4e0
 open_last_lookups+0x18e/0x7e0
 path_openat+0x83/0x2a0
 do_file_open_root+0x15a/0x230
 file_open_root+0xb0/0x1a0
 kernel_read_file_from_path_initns+0xcd/0x170
 fw_get_filesystem_firmware+0x173/0x400
 _request_firmware+0x2ba/0x3a0
 firmware_request_nowarn+0x3d/0x60
 cs35l41_request_firmware_file+0xea/0x360 [snd_hda_scodec_cs35l41]
 cs35l41_request_firmware_files_spkid.constprop.0+0x39/0x160 [snd_hda_scode=
c_cs35l41]
 cs35l41_request_firmware_files.constprop.0+0xf1/0x120 [snd_hda_scodec_cs35=
l41]
 cs35l41_init_dsp+0xae/0x250 [snd_hda_scodec_cs35l41]
 cs35l41_smart_amp+0x43/0x1f0 [snd_hda_scodec_cs35l41]
 cs35l41_fw_load_work+0x50/0x90 [snd_hda_scodec_cs35l41]
 process_one_work+0x19e/0x370
 worker_thread+0x1a6/0x310
 kthread+0xe4/0x120

(The other amp's cs35l41_fw_load_work, kworker/12:0, has the same
stack.)

task:btrfs-transacti state:D stack:0     pid:621   tgid:621   ppid:2
 io_schedule+0x46/0x70
 bit_wait_io+0x11/0x70
 __wait_on_bit+0x92/0xb0
 out_of_line_wait_on_bit+0x97/0xc0
 read_extent_buffer_pages+0x47/0x60
 btrfs_read_extent_buffer+0x69/0xa0
 read_block_for_search+0x201/0x3e0
 btrfs_search_slot+0x39e/0x1210
 btrfs_insert_empty_items+0x3a/0x80
 alloc_reserved_tree_block+0x13f/0x370
 run_delayed_tree_ref+0x1c5/0x2b0
 btrfs_run_delayed_refs_for_head+0x1f3/0x3b0

All CPUs were idle (swapper in cpuidle_enter_state), so this is a
deadlock, not a lockup.

Reproduction (hangs on the first try; I used a softdog to recover):

  sync; echo 3 > /proc/sys/vm/drop_caches; systemctl hibernate

Workaround, which also confirms the analysis: a systemd-sleep hook
that turns the "L0 DSP1 Firmware Load" and "R0 DSP1 Firmware Load"
controls off before a hibernation and back on after the resume. With
request_fw_load cleared, nothing is queued at the thaw, and the same
drop_caches test hibernates and resumes normally. The firmware reloads
from the hook after the resume.

As a fix, the driver could avoid loading firmware at the thaw: the
image is about to be written and the system powered off, and .restore
or .resume reloads it anyway. For example, separate .freeze, .thaw,
.poweroff and .restore callbacks instead of SYSTEM_SLEEP_PM_OPS, with
.thaw not queuing fw_load_work. I haven't tested this. More generally,
any filesystem I/O started between the thaw and the power-off can
deadlock like this when it misses the cache, at least on btrfs.

I'm happy to test patches, and can send the full logs.

--
Danylo Malyuta, PhD
https://www.malyuta.name
https://www.linkedin.com/in/danylomalyuta/


Sent with Proton Mail secure email.
