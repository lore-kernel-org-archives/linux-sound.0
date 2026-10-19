Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757A4CE693
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405862; cv=none; b=XihdE5ZkDgnfXsSM9T4RPXYN/arugmEEhciGfCVrcF23A4Un9HK6enCt4sNDirqm/qmVvoGAE8zieeCbvLLrzCIoGHhMqAJOhR3jVvaa9n8gVSaDVjTzd+t8vRyE8nmccVc3pwgdmFv2ewgMrWuwbWMvyKt0/xXBllzf56Lzhe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405862; c=relaxed/simple;
	bh=DXr0SWEL5Dre/H1WhO/WhmrprjnQpVq59lOhAu/vwuo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dfmMGXd90xioQqfmy5IcgRzixdRsN96r2sDX4GQ5iKqygvlU+KkRDPtGnESN5R6Ssh/XWsgUgw7k+7McpM94wn1TMAoD2x+oaQyWAJdv70O2dvRFbA0vDr+cE5sIhSEjkAXQUjw7E/eF4aq1C8pUkVBeVGSdfhDN0ECSD/1DrdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV+pznOU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV+pznOU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9995ce866so14319875ad.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405860; x=1793010660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXN1+8ZK0dBrxbkINaYoPOnUZ+nBaten6ac7/D0HEVg=;
        b=JV+pznOUZMhbZ+sQzFEdhuGtH+qaz73Ptw/fU215xnNsv0aHdFvW+tLhg0qaNj6QXZ
         4feldnxDIt5buobZa696/SUounnvdtJXH4/zQmjzsLsG/iq36vkXA1A9If+U8+GJgxhA
         U91J9MBl/NNGBTNJ0AOsnZru1lF7gQ3OaJQQLhkZxJXw170PiFmOE2uAr8FsWe6DwClS
         b3MzGIQnzS9JHuxRvG0nIKDbzN9up9Lnf+kxvRwbIuWYxe3vc0ywpSCysEzmcUBckNYt
         GVWo0+ATl8AL79+HQB0jfyejPNpwyZLO/MID296MF5O155fcJ6qcHVqGPLDA8xmqoCYc
         4BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405860; x=1793010660;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXN1+8ZK0dBrxbkINaYoPOnUZ+nBaten6ac7/D0HEVg=;
        b=lLIis1qw/VQIg2FmuJF1wYWojXJpjf5jOxWhHl3Fzm+demUQGuYAXazLqyiqbA90Ac
         uxyfXXTRcMoRq9bWjTJ8lNpLVjWVmFr4clsI5vZEKc+hiQ6s533HmlN5kIfWEbM2BDR6
         zWPA00yOxa4/pdkskzPJ8pQ3pMLFe24JSy2EL8uFvUhCAZSt1+0ULRtLXGT5l8NWxjzK
         Z1fwsKiLQDqPWBtGljx90T4Qq7n8ai2YSZSPadU3p0veVEm7OMWKG+4jYFAYnoKUiNQc
         X90TqUpHKBTkpJg7sxHAUQ2dSMdzjOGvUFT1xovr4XOsxieRf/kRntHVtoJ5BagolGmN
         oqsg==
X-Gm-Message-State: AFq9FYI7pX1hN3nYkQhoW48rhwVUO6mK4TXLoiGTW+8rpsV3fAHyZGch
	9fV17NfGcef0+wf4yHnA4oGQ+t3ZS3oNl/o1k/CbaQT0jFTOquNCBEwA
X-Gm-Gg: AYBFou369BA4VQo3eCOG+Db9+3b+bpkEseEgX8Rfif5Dgd1L2kjtY8Z9tGrxWG6ZCY8
	J0wC1JzdZaS/OTu+QLaRubILgBT5dqxKVPpKDGPw1zTwes0sOBDgDV26Sea0ij6vV7mKTzcqgra
	gUMbKdHc0wQtKsAwg2NqWPW+m2hrepCxr2C7b+rSYZPDVxZZOUdHApOGtFu/0pGTNuW+lbYZDje
	Gtk5ZYvZ1m923wrxd9R6dC85dIBMErTkdEQ8Gh1ai+fV5bJb5iUZKtkw5NVCtTNpwBrHEmVXUAY
	3Eni6puqfVhk5rOIu7neqqeXoIJ/Scik7A61/9ARyznBpoBLZJ6G37sjP5tnQXnFl6PgymrbdTM
	CHtDWWzli/NG5sedVAQFZE08lG0XfN+Zrdtl+U3Uu4tVkAwuEWVnu+H5qqF3g5ft5pghNrpMV68
	H8AHNLbTOHs/9JI9XA49/77QmxbsD39Hv3YOS8KE+kqBo6+hl+o1/jKeAzKafLX1tOww==
X-Received: by 2002:a17:903:22c6:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2e9a6d367b9mr60158785ad.61.1792405859533;
        Mon, 19 Oct 2026 03:30:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea0cda9d8fsm2427565ad.14.2026.10.19.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:30:59 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: jack: Pin the module while debugfs files are open
Date: Mon, 19 Oct 2026 18:30:54 +0800
Message-Id: <pm-pmb-431ddb947e1a13b95d3a-v3-02d37dd7b4eb4774e100@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With CONFIG_SND=m and CONFIG_SND_JACK_INJECTION_DEBUG enabled, an in-tree
HDA jack creates these debugfs files through snd_jack_new() and
snd_jack_add_debugfs(). Their file_operations live in snd, but none sets
.owner. full_proxy_open_regular() therefore takes no snd module reference
when it calls fops_get(real_fops).

A debugfs descriptor can outlive removal of its HDA card. Once the card
and dependent modules, including the OSS emulation modules, have been
removed, snd can be unloaded while that descriptor is still open:

  Descriptor holder                   Card/module teardown
  -----------------                   --------------------
  open jack debugfs file
    full_proxy_open_regular()
      fops_get(real_fops)
        owner == NULL: no snd pin
  keep descriptor open
                                      remove HDA card
                                        snd_card_disconnect()
                                          snd_jack_dev_disconnect()
                                          remove debugfs nodes
                                        snd_jack_dev_free()
                                      unload dependent modules
                                      rmmod snd
                                        alsa_sound_exit()
                                        free_module(): unmap snd
  close descriptor
    full_proxy_release()
      read real_fops->release
      fops_put(real_fops)
        read real_fops->owner

debugfs_remove() drains active operations, but does not wait for idle
open descriptors. Release deliberately bypasses removal protection and
reads the real table even when no release callback is installed. The
last close can therefore access unloaded snd storage.

Set .owner to THIS_MODULE in all six tables. The existing proxy
fops_get()/fops_put() pair then keeps snd loaded through the final table
access on close.

Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 0f04018181acb20f6bf85b11a9f6d4c7d3179e5a..4451249d055d028c8aa2757d75d0706fa47b4ad7 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -303,6 +303,7 @@ static ssize_t jack_type_read(struct file *file,
 }
 
 static const struct file_operations jack_type_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.read	=	jack_type_read,
 	.llseek	=	default_llseek,
@@ -310,6 +311,7 @@ static const struct file_operations jack_type_fops = {
 #endif
 
 static const struct file_operations sw_inject_enable_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.read	=	sw_inject_enable_read,
 	.write	=	sw_inject_enable_write,
@@ -317,24 +319,28 @@ static const struct file_operations sw_inject_enable_fops = {
 };
 
 static const struct file_operations jackin_inject_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.write	=	jackin_inject_write,
 	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_id_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.read	=	jack_kctl_id_read,
 	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_mask_bits_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.read	=	jack_kctl_mask_bits_read,
 	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_status_fops = {
+	.owner	=	THIS_MODULE,
 	.open	=	simple_open,
 	.read	=	jack_kctl_status_read,
 	.llseek	=	default_llseek,
