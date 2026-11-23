Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423740;
	b=1LXkg1vt9jgqicl+8BrbChWDphvwMYop/scSWOGuXKA9+VdL6jP9PV8C9cPdIo2ocbIP
	 zsAKOuPykvN9irJtOVm0mafWeES0KPUSV+EcYbP62hbNORotMPNDVw2PI9UQ1gE6z0KNM
	 gubogCcfuk8AL48J33CHkCslwsGgmHH2mt1NjQ5w+X1UGE9rrWDssNORcbGDXkQzrAReh
	 t42A7mYI8vuFiYbV7pCbb3sUbwmubWO5ehpyYrRmyyipI4B/WG4NarMILtShJWJfald0R
	 xUGvkrYNo6aBw3gMD9WWOS/lE16RUqdkxIKl6nwSoLaTTFiOnRwG3ZqbSHMjrjV4SOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423740;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=8ruDUU6qAs6jgDAY5/2s7xb1ucgP2T7d7QfNm0Jj150=;
	b=lnoM5qlIlCitKh8e/JNvW/W44rWegNo2L381RLunxfPTGkN1pVPna9q089dBd80i2CAH
	 xvvmvHSr4n5GVn/nla9gBDXGbFkkaCgL5yy0gx9JisvdW5S5I/0rsgNThMopQiVSzjavy
	 oPP7fJtaQwj7mATOnUuVRRHe3fKgdgdqrenwyz0uzDIY+rlqT7uuT4AvKvXf+yu5vHGn7
	 JGBQ6Ezk9gEWWzeWKudc/BuThsRJPdazUTxSyxuWs6SjQVBvEbDJjHQ7dFl0DBiaJVBq5
	 7Rr/TMq0x/6YC/0orCfUVN/iFmtFurtQogggb6kgQ1WAiBA3UMVEnpOOGLClBM1JQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B7A606A31A;
	Mon, 23 Nov 2026 08:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=8ruDUU6qAs
	6jgDAY5/2s7xb1ucgP2T7d7QfNm0Jj150=; b=FNCoXPCEU3XVqfPXXegSSE3VEh
	VNVFMTz+VrK9oRuCpmL3jnFAl6yiGT3GmG2OIjlOllG2fclA5XEX8/YdburhqrT+
	WkNKepz9XFfEQ/alc7tJkPZg6PhVCU1iWpFR/jiszDh4wMfmfwQu32Kk+DEuVY4z
	+CoNeKbmezv297Byo=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.33])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkC2ufzv_QNrKK0aAg--.14474S2;
	Mon, 23 Nov 2026 16:48:48 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [PATCH 0/2] ALSA: 6fire: avoid resubmitting an active URB
Date: Mon, 23 Nov 2026 16:48:44 +0800
Message-Id: <20261123084846.7700-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkC2ufzv_QNrKK0aAg--.14474S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1rCFW3uF4UJw4rJFWrKrg_yoWDZFb_u3
	yFvryxAw48uFZxGFykGr43ArWkCa1xZr1fCFWF9ryxGr1YyryYkr929r95Ww4Yva1Fvw1x
	tr13KrykCr92gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jF1v3UUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUFD2sDBVgdigAFsp

The 6fire driver submits URBs from callbacks that do not own them, and the
USB core complains when the URB is still queued:

  URB 000000003ec29e65 submitted while active
  WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb

There are two independent paths.  The MIDI output resubmits rt->out_urb
after the stream was stopped while the previous transfer was still in
flight, and the PCM capture handler unconditionally resubmits the
playback URB paired with the capture URB that has just completed.

Both patches make the driver check whether the URB is still queued, as
sound/usb/midi.c does with active_urbs, and leave the data to the
completion handler instead of submitting an active URB.


YuanZhe Liu (2):
  ALSA: 6fire: Don't resubmit an active MIDI URB
  ALSA: 6fire: Don't resubmit an active PCM out URB

 sound/usb/6fire/midi.c | 21 +++++++++++++++++----
 sound/usb/6fire/midi.h |  1 +
 sound/usb/6fire/pcm.c  | 16 +++++++++++++++-
 sound/usb/6fire/pcm.h  |  2 ++
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.34.1

