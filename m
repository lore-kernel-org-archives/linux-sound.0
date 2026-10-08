Received: from mail-108-mta74.mxroute.com (mail-108-mta74.mxroute.com [136.175.108.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD1D489889
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501108; cv=none; b=XEq86/gSN7foWIjdijvF9nnBzv/i8h+czSUn97DN2lk9AIM8Ga34MghalWkTAzjZUMcko6h0YrLOpYqcG+XpCHZb1RujDn3HaknSQH6SlKiSOdxAMQ2xMBCxTkXxf9UATWBDs92G9Vsx/5aUJ88Rt2+T+MLsTyq/nWTu5sb5SUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501108; c=relaxed/simple;
	bh=ci2nWy6TPLcCzrRQeHD/g0MGgb2ckCkhG++CUCckGU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmYNXFHenGW0J5oRixHzmvAKRlDoGMu/gRXs6G9LzaqKKtV4WFe/99FD5JAWiqQjS6fVsPqbPVr5h7pha7bRELw2h6BeMB63g5FcgSZsURyVwvSIqwc/4dJvBx+zd57QEfODqAKpMPi70E9edACtaXecfRxpp0Z0G4IcW9uTsmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=tnWQsb+c; arc=none smtp.client-ip=136.175.108.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="tnWQsb+c"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta74.mxroute.com (ZoneMTA) with ESMTPSA id 1a11dc9661700028b2.008
 for <linux-sound@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 23:11:40 +0000
X-Zone-Loop: 1e5aa3641aa6da120b87dc80e53a2479a7f045509621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=v8NtoUxOg7etuRYJocFeITKS2XPCVARYVN/AW9BTl5k=; b=tnWQsb+c8r3xNEadShgxeSZOgt
	zcaQTnPLMHnkNrAnz8ZZ0Za16g+mnkHoIr3VzPLF3fCPyDJlj7NEER4r2ZWcFCSLwf2QWMjWEMRXR
	/GN7jPyL0Ci9XGgA3sWP4w9WYer1T5AHOdna/I/Tkz3NUEclNqA8won+4Kt3KtdurWB2ScXwpIieL
	U6DKsdSqQWLdrFW77cP9YPx7lHWABihwY3LhDOw4Jlw7J0gw+68FJcaBh2/6hX0WZdgnPEW44HsNC
	ChwEHmYF6uS2nmmgSB2IR0fwzWbf5TwXCUMI5hvQP4cBn2MZOuefrA0r7FINVq6MDWcGwn5RYOVFT
	aO0msRDQ==;
Date: Thu, 8 Oct 2026 23:11:32 +0000
From: Richard Patel <ripatel@wii.dev>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asgjJLeH12OAlYai@wii.dev>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
 <asOiEwRp77ETKznr@opensource.cirrus.com>
 <asePYrXFHxHNssgK@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asePYrXFHxHNssgK@opensource.cirrus.com>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Oct 08, 2026 at 01:41:06PM +0100, Charles Keepax wrote:          
> On Mon, Oct 05, 2026 at 02:11:47PM +0100, Charles Keepax wrote:        
> > On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:      
> > > On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:     
> > > > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:  
> > > > I don't understand the code very well, but isn't there a second UAF
> > > > with the ctx object getting freed?  kfree(ctx) in sdw_intel_exit()
> > > > runs well before the IRQ is unregistered.                        
> > >                                                                    
> > > This situation is unfortunately fairly complex, the IRQ is shared  
> > > between many different functions and only the SoundWire function   
> > > relies on ctx. I will do some more poking, but I believe the       
> > > free order is such that the soundwire stuff is shutdown before     
> > > ctx is freed. I am not 100% certain if that will prevent the       
> > > SoundWire IRQ path from getting called, although I would like      
> > > to believe it does :-)                                             
> >                                                                      
> > Hmm... ok so poking this a little more looks like I do see just      
> > see these freed in hard the wrong order so we should probably        
> > fix that up too. Thanks for spotting that I will have a bit of       
> > a think.                                                             
>                                                                        
> Ok found some time to look at this properly I think this is all        
> fine. sdw_intel_exit() first calls sdw_intel_cleanup() which will      
> eventually call sdw_cdns_enable_interrupt(..., false), which           
> should disable the SoundWire IRQs. Then sdw_intel_exit() frees         
> the ctx, whilst at that point whilst the IRQ is still registered       
> one should no longer be able to see soundwire IRQs, so you shouldn't   
> get a dereferencing of ctx.                                            
                                                                         
On my Galaxy Book6, I was able to get a ctx UAF with your v2 patch set
by adding a sleep.

  BUG: unable to handle page fault for address: fffffffffffffff8
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 5 UID: 0 PID: 34491 Comm: irq/165-AudioDS Kdump: loaded Tainted: G           OE       7.3.0-rc6-ibt+ #2 PREEMPT(lazy) 
  RIP: 0010:sdw_intel_thread+0x3c/0x70 [soundwire_intel]
  Call Trace:
   <TASK>
   hda_dsp_interrupt_thread+0x97/0x320 [snd_sof_intel_hda_generic]
   irq_thread_fn+0x23/0x60
   irq_thread+0xc7/0x190
   kthread+0xe5/0x120
   </TASK>

--Richard

---
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index a7437cd42028..66a08dad7281 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -155,6 +155,8 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 	struct sdw_intel_ctx *ctx = dev_id;
 	struct sdw_intel_link_res *link;
 
+	msleep(5000);
+
 	mutex_lock(&ctx->link_lock);
 	list_for_each_entry(link, &ctx->link_list, list)
 		sdw_cdns_irq(irq, link->cdns);
@@ -393,6 +395,7 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 	sdw_intel_cleanup(ctx);
 	kfree(ctx->peripherals);
 	kfree(ctx->ldev);
+	memset(ctx, 0, sizeof(*ctx));
 	kfree(ctx);
 }
 EXPORT_SYMBOL_NS(sdw_intel_exit, "SOUNDWIRE_INTEL_INIT");

